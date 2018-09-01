using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FadeScreen : MonoBehaviour
{

    private Image image;

    public AnimationCurve Fade;
    public AnimationCurve FadeInOut;

    public static FadeScreen Instance;

    void Awake()
    {
        Instance = this;
        image = GetComponent<Image>();
        image.enabled = false;

    }

    public IEnumerator TriggerFadeInOutToColor(Color color, float duration)
    {
		StopAllCoroutines();

        float timer = 0f;
        float alpha = 0f;

        image.enabled = true;

        while (timer < duration)
        {
            timer += Time.deltaTime;
            alpha = timer / duration;
            color.a = FadeInOut.Evaluate(alpha);
            image.color = color;

            yield return null;
        }

        image.enabled = false;
    }

    public IEnumerator TriggerFadeFromColor(Color color, float duration)
    {

		StopAllCoroutines();

        float timer = 0f;
        float alpha = 0f;

        image.enabled = true;

        while (timer < duration)
        {
            timer += Time.deltaTime;
            alpha = timer / duration;
            color.a = Fade.Evaluate(1f - alpha);
            image.color = color;

            yield return null;
        }

        image.enabled = false;
    }

    public IEnumerator TriggerFadeToColor(Color color, float duration)
    {

		StopAllCoroutines();

        float timer = 0f;
        float alpha = 0f;

        image.enabled = true;

        while (timer < duration)
        {
            timer += Time.deltaTime;
            alpha = timer / duration;
            color.a = Fade.Evaluate(alpha);
            image.color = color;

            yield return null;
        }
    }



}
