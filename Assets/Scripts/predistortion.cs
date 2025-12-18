using UnityEngine;

[ExecuteAlways]
public class predistortion : MonoBehaviour
{
    [Header("Materials")]
    public Material opticsDistortMat;   // Forward
    public Material preCorrectMat;      // Inverse

    [Header("Toggles")]
    public bool simulateOptics = true;
    public bool applyPreCorrection = true;

    [Header("Strength Controls")]
    [Range(-1f, 1f)]
    public float distortionStrength = 0.15f; 

    [Range(-1f, 1f)]
    public float correctionStrength = 0.15f; 

    static readonly int C1_ID = Shader.PropertyToID("_C1");
    static readonly int C2_ID = Shader.PropertyToID("_C2");

    private void OnRenderImage(RenderTexture src, RenderTexture dest)
    {
        if ((simulateOptics && opticsDistortMat == null) ||
            (applyPreCorrection && preCorrectMat == null))
        {
            Graphics.Blit(src, dest);
            return;
        }
        // optics distortion coefficients in brown's equaton
        if (opticsDistortMat != null)
        {
            float C1 = distortionStrength;
            float C2 = 0.5f * C1;

            opticsDistortMat.SetFloat(C1_ID, C1);
            opticsDistortMat.SetFloat(C2_ID, C2);
        }

        // pre correction coeff in brown's inverse eqn
        if (preCorrectMat != null)
        {
            float K1 = correctionStrength;
            float K2 = 0.5f * K1;

            preCorrectMat.SetFloat(C1_ID, K1);
            preCorrectMat.SetFloat(C2_ID, K2);
        }

        RenderTexture tmp = RenderTexture.GetTemporary(src.width, src.height, 0, src.format);
        RenderTexture current = src;

        if (applyPreCorrection)
        {
            Graphics.Blit(current, tmp, preCorrectMat);
            current = tmp;
        }

        if (simulateOptics)
        {
            Graphics.Blit(current, dest, opticsDistortMat);
        }
        else
        {
            Graphics.Blit(current, dest);
        }

        RenderTexture.ReleaseTemporary(tmp);
    }
}
