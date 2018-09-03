using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameController : MonoBehaviour
{

	public Transform playerSpawn;
	public GameObject player;

	public Color playerColorA, playerColorB;
	[ColorUsageAttribute(true, true)] public Color bonusColorA, bonusColorB;

	public float bonusAProportion;
	public Color collisionColor;

	private bool hasEnded;

	private bool isColorA;

	public Text validText, errorText;

	public float minColorSwitchTime, maxColorSwitchTime;

	public float endZ = 5800f;

	private int errorCount, validCount;

	public static GameController Instance;

	void Awake() => Instance = this;

	// Use this for initialization
	void Start()
	{

		WorldGenerator.Instance.Generate();
		WorldGenerator.Instance.AssignColor(bonusAProportion, bonusColorA, bonusColorB);
		SpawnPlayer();
		StartCoroutine(FadeScreen.Instance.TriggerFadeFromColor(Color.black, 4f));

		StartCoroutine(ColorSwitch());

	}

	public void OnBonusPicked(bool isValid)
	{
		if (isValid)
		{
			validCount++;
			validText.text = validCount.ToString();
		}
		else
		{
			errorCount++;
			errorText.text = errorCount.ToString();
		}
	}

	void Update()
	{
		if (player.transform.position.z > endZ && !hasEnded)
		{
			hasEnded = true;
			StartCoroutine(Endgame());
		}
	}

	IEnumerator ColorSwitch()
	{

		player.GetComponent<PlayerController>().SwitchColor(isColorA ? playerColorA : playerColorB);
		player.GetComponent<PlayerController>().isColorA = isColorA;
		//WorldGenerator.Instance.SwitchColor(isColorA? bonusColorA : bonusColorB);

		yield return new WaitForSeconds(Random.Range(minColorSwitchTime, maxColorSwitchTime));

		isColorA = !isColorA;

		StartCoroutine(ColorSwitch());
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
		WorldGenerator.Instance.AssignColor(bonusAProportion, bonusColorA, bonusColorB);
		SpawnPlayer();
	}

	public void ResetCounters()
	{
		validCount = 0;
		errorCount = 0;
		errorText.text = errorCount.ToString();
		validText.text = validCount.ToString();

	}

	void SpawnPlayer()
	{
		ResetCounters();
		player.transform.position = playerSpawn.position;
		player.GetComponent<PlayerController>().Initialize();
	}
}
