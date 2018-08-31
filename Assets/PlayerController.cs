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

	public LayerMask groundMask;

	private float horizontalInput;

	// Use this for initialization
	void Start()
	{
		

	}

	// Update is called once per frame
	void Update()
	{
		Vector3 movement = Vector3.zero;

		movement += Vector3.forward * forwardSpeed;

		horizontalInput = Input.GetAxis("Horizontal");

		movement += lateralSpeed * Vector3.right * horizontalInput;

		transform.position += movement * Time.deltaTime;

	}

	private void LateUpdate()
	{

		RaycastHit hit;
		Physics.Raycast(groundCheckOrigin.position + Vector3.up * 500f, Vector3.down, out hit, 1000f, groundMask);
		float groundAltitude = hit.point.y;
		float groundNormal = 90f - Vector3.Angle(hit.normal, Vector3.forward);
		Debug.Log(groundNormal);

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
	
	private void OnTriggerEnter(Collider other) {

		if(other.CompareTag("Obstacle")){

			GameController.Instance.OnPlayerCollision();
		}
		
	}
}
