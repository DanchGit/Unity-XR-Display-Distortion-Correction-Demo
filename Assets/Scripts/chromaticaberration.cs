using UnityEngine;

[ExecuteAlways]
public class chromaticaberration
    : MonoBehaviour
{
    [Header("Materials")]
    public Material opticsCAMat;      // adds CA (simulate lens)
    public Material preCorrectCAMat;  // inverse CA (pre-correction)

    [Header("Toggles")]
    public bool simulateOpticsCA = true;
    public bool applyPreCorrectionCA = true;

    [Header("Strength")]
    [Range(0f, 0.05f)] // use small values. start ~0.01
    public float opticsStrength = 0.015f;

    [Range(0f, 0.05f)]
    public float correctionStrength = 0.015f;

    private void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        RenderTexture tmp = RenderTexture.GetTemporary(src.width, src.height, 0, src.format);
        RenderTexture current = src;

        if (applyPreCorrectionCA)
        {
            preCorrectCAMat.SetFloat("_Strength", correctionStrength);
            Graphics.Blit(current, tmp, preCorrectCAMat);
            current = tmp;
        }

        if (simulateOpticsCA)
        {
            opticsCAMat.SetFloat("_Strength", opticsStrength);
            Graphics.Blit(current, dest, opticsCAMat);
        }

        else
        {
            Graphics.Blit(current, dest);
        }

        RenderTexture.ReleaseTemporary(tmp);
    }
}
