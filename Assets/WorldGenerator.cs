using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldGenerator : MonoBehaviour
{

	[Header("Terrain")]
	public Terrain terrain;
	public float hmPerlinScale1 = 1f;
	public float hmPerlinScale2 = 1f;
	public float hmHarmonicFactor = 0.5f;

	public AnimationCurve horizontalProfile;

	[Header("Objects")]
	public GameObject cubePrefab;
	public float minSizeXZ, maxSizeXZ;
	public float minSizeY, maxSizeY;
	public Bounds bounds;
	public int amount;
	public AnimationCurve lateralDensityProfile;
	public AnimationCurve forwardDensityProfile;

	float[,] heightMap;

	List<GameObject> objects = new List<GameObject>();

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
				float distanceToCenter = Mathf.Abs(y - heightMapWidth / 2) / (float)heightMapWidth;
				float x_norm = (float)x / heightMapWidth;
				float y_norm = (float)y / heightMapWidth;

				float normalizedHeight = (1 - hmHarmonicFactor) * Mathf.PerlinNoise(
					(hmPerlinSeed1.x + x_norm / aspectRatio) * hmPerlinScale1,
					(hmPerlinSeed1.y + y_norm) * hmPerlinScale1);

				normalizedHeight += (hmHarmonicFactor) * Mathf.PerlinNoise(
					(hmPerlinSeed2.x + x_norm / aspectRatio) * hmPerlinScale2,
					(hmPerlinSeed2.y + y_norm) * hmPerlinScale2);

				heightMap[x, y] = normalizedHeight * horizontalProfile.Evaluate(distanceToCenter);
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

		for (int i = 0; i < amount; i++)
		{
			// use LERP between two extremes ? 

			position.x = (-1f + 2f * forwardDensityProfile.Evaluate(Random.value)) * bounds.extents.x + bounds.center.x;
			//position.y = Random.Range(-1f, 1f) * bounds.extents.y;
			position.z = Random.Range(-1f, 1f) * bounds.extents.z + bounds.center.z;
			position.y = GetWorldYAtWorldXZ(position.x, position.z);

			rotation = Quaternion.identity;
			//rotation = Quaternion.Euler(Random.Range(0,180f),Random.Range(0,180f),Random.Range(0,180f));

			obj = Instantiate(cubePrefab, position, rotation, this.transform);
			objects.Add(obj);

			scale.x = Random.Range(minSizeXZ, maxSizeXZ);
			scale.y = Random.Range(minSizeY, maxSizeY);
			scale.z = Random.Range(minSizeXZ, maxSizeXZ);

			obj.transform.localScale = scale;

			//cube.GetComponent<Renderer>().material.color;
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

		for (int i = 0; i < objects.Count; i++)
		{
			GameObject obj = objects[0];
			objects.RemoveAt(0);
			Destroy(obj);
		}
	}
}
