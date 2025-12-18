using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BarrelDistortion : MonoBehaviour
{
    public Material mat;

    [Range(-2f, 2f)]
    public float strength = 0.0f;

    private void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        if (mat == null)
        {
            Graphics.Blit(src, dest);
            return;
        }

        mat.SetFloat("_Strength", strength);
        Graphics.Blit(src, dest, mat);
    }
}