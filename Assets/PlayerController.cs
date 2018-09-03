using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{

    public float forwardSpeed;
    public float lateralSpeed;


    public float flyingAltitude;
    public float alitudeCorrectionSpeed;

    public float maxRollAngle = 25f;
    public float maxPitchAngle = 25f;

    public float rotateAnimationSpeed = 1f;

    public Transform groundCheckOrigin;

    public Transform model;

	public Renderer[] renderers;

    public LayerMask groundMask;

    public Camera camera;

    public float baseFov = 60f;

	public bool isColorA;

    private float horizontalInput;
	private bool colliding;

    private float GetBonusSpeed()
    {
        float bonusSpeed = 0f;
        foreach (Bonus bonus in currentActiveBonus)
        {
            bonusSpeed += bonus.currentBonusSpeed;
        }

        return bonusSpeed;
    }
    private float GetBonusFov()
    {
        float bonusFov = 0f;
        foreach (Bonus bonus in currentActiveBonus)
        {
            bonusFov += bonus.currentBonusFov;
        }

        return bonusFov;
    }

    public List<Bonus> currentActiveBonus = new List<Bonus>();

    // Use this for initialization
    public void Initialize()
    {
        camera.fieldOfView = baseFov;
		colliding = false;
		currentActiveBonus.Clear();
    }

	public void SwitchColor(Color color){

		foreach(Renderer rend in renderers){

			rend.material.color = color;
		}
	}

    // Update is called once per frame
    void Update()
    {
        Vector3 movement = Vector3.zero;

        movement += Vector3.forward * (forwardSpeed + GetBonusSpeed());

        horizontalInput = Input.GetAxis("Horizontal");

        movement += (lateralSpeed + GetBonusSpeed()) * Vector3.right * horizontalInput;

        transform.position += movement * Time.deltaTime;

        camera.fieldOfView = baseFov + GetBonusFov();

    }

    private void LateUpdate()
    {

        RaycastHit hit;
        Physics.Raycast(groundCheckOrigin.position + Vector3.up * 500f, Vector3.down, out hit, 1000f, groundMask);
        float groundAltitude = hit.point.y;
        float groundNormal = 90f - Vector3.Angle(hit.normal, Vector3.forward);

        TurnAnimation(groundNormal);
        AdjustHeight(groundAltitude);
    }

    private void TurnAnimation(float groundNormal)
    {

        float rotZ = -1f * horizontalInput * maxRollAngle;
        float rotY = 0;
        float rotX = 1f * groundNormal * maxPitchAngle / 45f;

        model.transform.rotation = Quaternion.Slerp(model.transform.rotation, Quaternion.Euler(rotX, rotY, rotZ), rotateAnimationSpeed * Time.deltaTime);

    }

    void AdjustHeight(float groundAltitude)
    {
        float newHeight = Mathf.Lerp(transform.position.y, groundAltitude + flyingAltitude, alitudeCorrectionSpeed * Time.deltaTime);
        transform.position = new Vector3(transform.position.x, newHeight, transform.position.z);
    }

    IEnumerator OnBonusPicked(Bonus bonus, bool correct)
    {
        float timer = 0f;
        float alpha = 0f;
		float bonusSpeed = correct ? bonus.bonusSpeed : -bonus.bonusSpeed;
		float bonusFov = correct ? bonus.bonusFov : -bonus.bonusFov;
        bonus.GetComponentInChildren<Renderer>().enabled = false;
        currentActiveBonus.Add(bonus);
		StartCoroutine(FadeScreen.Instance.TriggerFadeInOutToColor(
			correct ? bonus.flashColorCorrect : bonus.flashColorError, correct ? bonus.flashDurationCorrect : bonus.flashDurationError));

        while (timer < bonus.bonusDuration)
        {
            timer += Time.deltaTime;
            alpha = timer / bonus.bonusDuration;
            bonus.currentBonusSpeed = bonusSpeed * bonus.bonusSpeedCurve.Evaluate(alpha);
            bonus.currentBonusFov = bonusFov * bonus.bonusSpeedCurve.Evaluate(alpha);
            yield return null;
        }
        bonus.currentBonusSpeed = 0f;
        bonus.currentBonusFov = 0f;
        currentActiveBonus.Remove(bonus);
    }



    private void OnTriggerEnter(Collider other)
    {

        if (other.CompareTag("Obstacle") && !colliding)
        {
			colliding = true;
            GameController.Instance.OnPlayerCollision();	
        }

        if (other.CompareTag("Bonus"))
        {
            Bonus bonus = other.GetComponent<Bonus>();
            if (bonus.picked) return;
            else bonus.picked = true;
			bool isValid = isColorA == bonus.isColorA;
			StartCoroutine(OnBonusPicked(bonus, isValid));
			
			GameController.Instance.OnBonusPicked(isValid);	
            
        }

    }
}
