using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bonus : MonoBehaviour {

	public float bonusSpeed;
    public float bonusDuration;

	public float bonusFov = 15f;
    public AnimationCurve bonusSpeedCurve;

	public  float currentBonusSpeed;
	public  float currentBonusFov;


	public Color flashColor;
	public float flashDuration;

	public bool picked = false;

	public Renderer rend;

	public Texture[] symbols;

	void Start(){

		int symbolIndex = Random.Range(0, symbols.Length);

		rend.material.mainTexture = symbols[symbolIndex];

	}


}
