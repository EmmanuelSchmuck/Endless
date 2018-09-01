using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour
{

    public Transform playerSpawn;
    public GameObject player;
    public Color collisionColor;

    private bool hasEnded;

    public float endZ = 5800f;

    public static GameController Instance;

    void Awake() => Instance = this;

    // Use this for initialization
    void Start()
    {

        WorldGenerator.Instance.Generate();
        SpawnPlayer();
        StartCoroutine(FadeScreen.Instance.TriggerFadeFromColor(Color.black, 4f));
    }

    void Update()
    {

        if (player.transform.position.z > endZ && !hasEnded)
        {
			hasEnded = true;
            StartCoroutine(Endgame());
        }

    }

    IEnumerator Endgame()
    {
		yield return StartCoroutine(FadeScreen.Instance.TriggerFadeToColor(Color.black, 4f));
		SceneManager.LoadScene("Menu");
		
    }

    public void OnPlayerCollision()
    {
        StartCoroutine(FadeScreen.Instance.TriggerFadeFromColor(collisionColor, 2f));

        WorldGenerator.Instance.Generate();
        SpawnPlayer();
    }

    void SpawnPlayer()
    {
		player.transform.position = playerSpawn.position;
        player.GetComponent<PlayerController>().Initialize();     
    }


}
