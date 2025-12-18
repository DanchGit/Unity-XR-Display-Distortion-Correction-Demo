Shader "Custom/Barrel_Pincushion_Shader"
{
    Properties
    {
        _MainTex("Source", 2D) = "white" {}
        _Strength("Strength", Range(-2,2)) = 0
    }

        SubShader
        {
            Tags { "RenderType" = "Opaque" "Queue" = "Overlay" }
            Cull Off ZWrite Off ZTest Always

            Pass
            {
                CGPROGRAM
                #pragma vertex vert_img
                #pragma fragment frag
                #include "UnityCG.cginc"

                sampler2D _MainTex;
                float _Strength;

                fixed4 frag(v2f_img i) : SV_Target
                {
                    float2 uv = i.uv;

                    // Center coordinates
                    float2 centre = uv - float2(0.5, 0.5);

                    // radius = x^2 + y^2  (this is r^2)
                    float radius = centre.x * centre.x + centre.y * centre.y;

                    // Match your reference:
                    // transform = ((_Strength + 0.4*sqrt(radius)) * radius) + 1
                    float transform = ((_Strength + (0.4 * sqrt(radius))) * radius) + 1.0;

                    // New UV
                    float2 uvDistorted = float2(0.5, 0.5) + (transform * centre);

                    // Out-of-bounds check
                    if (uvDistorted.x < 0 || uvDistorted.x > 1 || uvDistorted.y < 0 || uvDistorted.y > 1)
                        return fixed4(0, 0, 0, 1);

                    return tex2D(_MainTex, uvDistorted);
                }
                ENDCG
            }
        }
}
