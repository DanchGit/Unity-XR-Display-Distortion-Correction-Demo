Shader "Custom/CA_PreCorrect"
{
    Properties
    {
        _MainTex("Source", 2D) = "white" {}
        _Strength("Strength", Range(0,0.05)) = 0.015
    }

        SubShader
        {
            Tags { "Queue" = "Overlay" }
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
                    float2 c = uv - 0.5;

                    float r = length(c);
                    float amt = _Strength * r;

                    float2 dir = (r > 1e-6) ? (c / r) : float2(0,0);

                    float2 uvR = uv - dir * amt;
                    float2 uvG = uv;
                    float2 uvB = uv + dir * amt;

                    fixed rC = tex2D(_MainTex, uvR).r;
                    fixed gC = tex2D(_MainTex, uvG).g;
                    fixed bC = tex2D(_MainTex, uvB).b;

                    return fixed4(rC, gC, bC, 1);
                }
                ENDCG
            }
        }
}
