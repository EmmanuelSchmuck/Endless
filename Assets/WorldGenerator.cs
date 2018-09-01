using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldGenerator : MonoBehaviour
{
    public LayerMask bonusPlacementMask;

    [Header("Terrain")]
    public Terrain terrain;
    public float hmPerlinScale1 = 1f;
    public float hmPerlinScale2 = 1f;
    public float hmHarmonicFactor = 0.5f;

    public AnimationCurve lateralHeightProfile;
    public AnimationCurve forwardHeightProfile;

    [Header("Objects")]
    public GameObject obstaclePrefab;
    public GameObject bonusPrefab;
    public float minSizeXZ, maxSizeXZ;
    public float minSizeY, maxSizeY;
    public Bounds obstacleBounds;
    public int obstacleAmount;
    public AnimationCurve lateralDensityProfile;
    public AnimationCurve forwardDensityProfile;

    public Bounds bonusBounds;
    public int bonusAmount;

    public float bonusAltitude;
    public float bonusMinDistToAnother;

    public float bonusClearanceDistance;



    float[,] heightMap;

    List<GameObject> obstacles = new List<GameObject>();
    List<GameObject> bonus = new List<GameObject>();

    public static WorldGenerator Instance;

    private void Awake() => Instance = this;


    // Update is called once per frame
    public void Generate()
    {

        SetTerrainheight();

        //SetTerrainTextures();

        CleanObjects();

        SetObjects();
    }

    void SetTerrainheight()
    {

        Vector2Int hmPerlinSeed1 = new Vector2Int(Random.Range(0, 255), Random.Range(0, 255));
        Vector2Int hmPerlinSeed2 = new Vector2Int(Random.Range(0, 255), Random.Range(0, 255));

        int heightMapWidth = terrain.terrainData.heightmapWidth;

        heightMap = new float[heightMapWidth, heightMapWidth];

        float aspectRatio = terrain.terrainData.size.x / terrain.terrainData.size.z;
        float terrainSizeX = terrain.terrainData.size.x;

        for (int x = 0; x < heightMapWidth; x++)
        {
            for (int y = 0; y < heightMapWidth; y++)
            {
                float x_norm = (float)x / heightMapWidth;
                float y_norm = (float)y / heightMapWidth;

                float normalizedHeight = (1 - hmHarmonicFactor) * Mathf.PerlinNoise(
                    (hmPerlinSeed1.x + x_norm / aspectRatio) * hmPerlinScale1,
                    (hmPerlinSeed1.y + y_norm) * hmPerlinScale1);

                normalizedHeight += (hmHarmonicFactor) * Mathf.PerlinNoise(
                    (hmPerlinSeed2.x + x_norm / aspectRatio) * hmPerlinScale2,
                    (hmPerlinSeed2.y + y_norm) * hmPerlinScale2);

                heightMap[x, y] = normalizedHeight
                    * lateralHeightProfile.Evaluate(y_norm)
                    * forwardHeightProfile.Evaluate(x_norm);
            }
        }

        terrain.terrainData.SetHeights(0, 0, heightMap);
    }

    void SetTerrainTextures()
    {

        int alphaMapWidth = terrain.terrainData.alphamapWidth;
        int alphaTextureCount = 2;

        float[,,] alphaMap = new float[alphaMapWidth, alphaMapWidth, alphaTextureCount];

        for (int x = 0; x < alphaMapWidth; x++)
        {
            for (int y = 0; y < alphaMapWidth; y++)
            {
                float height = heightMap[x, y];

                alphaMap[x, y, 0] = height;
                alphaMap[x, y, 1] = 1f - height;

            }
        }

        terrain.terrainData.SetAlphamaps(0, 0, alphaMap);

    }

    void SetObjects()
    {

        Vector3 position = Vector3.zero;
        Vector3 scale = Vector3.zero;
        GameObject obj;
        Quaternion rotation;
        RaycastHit hit = new RaycastHit();

        for (int i = 0; i < obstacleAmount; i++)
        {
            // use LERP between two extremes ? 

            position.x = (-1f + 2f * forwardDensityProfile.Evaluate(Random.value)) * obstacleBounds.extents.x + obstacleBounds.center.x;
            //position.y = Random.Range(-1f, 1f) * bounds.extents.y;
            position.z = Random.Range(-1f, 1f) * obstacleBounds.extents.z + obstacleBounds.center.z;
            position.y = GetWorldYAtWorldXZ(position.x, position.z);

            rotation = Quaternion.identity;
            //rotation = Quaternion.Euler(Random.Range(0,180f),Random.Range(0,180f),Random.Range(0,180f));

            obj = Instantiate(obstaclePrefab, position, rotation, this.transform);
            obstacles.Add(obj);

            scale.x = Random.Range(minSizeXZ, maxSizeXZ);
            scale.y = Random.Range(minSizeY, maxSizeY);
            scale.z = Random.Range(minSizeXZ, maxSizeXZ);

            obj.transform.localScale = scale;

            //cube.GetComponent<Renderer>().material.color;
        }

        for (int i = 0; i < bonusAmount; i++)
        {
            // use LERP between two extremes ?


            int attempts = 0;
            bool tooClose = true;

            do
            {
                attempts++;

                position.x = Random.Range(-1f, 1f) * bonusBounds.extents.x + bonusBounds.center.x;
				position.y = terrain.transform.position.y;

                position.z = Random.Range(-1f, 1f) * bonusBounds.extents.z + bonusBounds.center.z;
                

                Physics.SphereCast(position + Vector3.up * 1000f, bonusClearanceDistance, Vector3.down, out hit, 2000f, bonusPlacementMask);

				position.y = hit.point.y + bonusAltitude;

                tooClose = false;

                foreach (GameObject bo in bonus)
                {
                    float dist = Vector3.Distance(bo.transform.position, position);
                    if (dist < bonusMinDistToAnother)
                    {
                        tooClose = true;
                        break;
                    }
                }

            } while (attempts < 100 && (hit.collider.CompareTag("Obstacle") || tooClose));

            if (attempts == 100) Debug.Log("warning : cannot place bonus");



            rotation = Quaternion.identity;
            //rotation = Quaternion.Euler(Random.Range(0,180f),Random.Range(0,180f),Random.Range(0,180f));

            obj = Instantiate(bonusPrefab, position, rotation, this.transform);
            bonus.Add(obj);
        }


    }

    float GetWorldYAtWorldXZ(float x, float z)
    {
        float height = 0f;
        //Debug.Log("x - terrain.transform.position.x : " + (x - terrain.transform.position.x));
        int hmRes = terrain.terrainData.heightmapResolution;
        int hmX = hmRes * (int)(x - terrain.transform.position.x) / (int)terrain.terrainData.size.x; //Debug.Log("hmX : " + hmX);
        int hmY = hmRes * (int)(z - terrain.transform.position.z) / (int)terrain.terrainData.size.z;
        if (hmX >= hmRes || hmX < 0 || hmY >= hmRes || hmY < 0) return 0;
        height = terrain.terrainData.GetHeight(hmX, hmY) + terrain.transform.position.y;
        return height;
    }

    void CleanObjects()
    {

        for (int i = 0; i < obstacles.Count; i++)
        {
            GameObject obj = obstacles[0];
            obstacles.RemoveAt(0);
            Destroy(obj);
        }

        for (int i = 0; i < bonus.Count; i++)
        {
            GameObject obj = bonus[0];
            bonus.RemoveAt(0);
            Destroy(obj);
        }
    }
}
