using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour {

	public Transform target;
	public Vector3 offset;

	public float smoothingSpeed = 1f;

	// Use this for initialization
	void Start () {

		
		
	}
	
	// Update is called once per frame
	void LateUpdate () {

		transform.position = Vector3.Lerp(transform.position, target.position + offset, smoothingSpeed * Time.deltaTime);
		
	}
}
