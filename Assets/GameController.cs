using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameController : MonoBehaviour
{

	public Transform playerSpawn;
	public GameObject player;

	public static GameController Instance;

	void Awake() => Instance = this;

	// Use this for initialization
	void Start()
	{
		SpawnPlayer();
		WorldGenerator.Instance.Generate();
	}

	public void OnPlayerCollision()
	{
		SpawnPlayer();
		WorldGenerator.Instance.Generate();
	}

	void SpawnPlayer()
	{
		player.transform.position = playerSpawn.position;
	}


}
