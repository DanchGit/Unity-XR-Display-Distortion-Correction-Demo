Shader "Custom/BrownInverse"
{
    Properties
    {
        _MainTex("Source", 2D) = "white" {}
        _C1("c1", Float) = 0.10
        _C2("c2", Float) = 0.05
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
                float _C1, _C2;

                fixed4 frag(v2f_img i) : SV_Target
                {
                    float2 uv = i.uv;

                    float2 p = uv - 0.5;

                    float aspect = _ScreenParams.x / _ScreenParams.y;
                    float2 pa = float2(p.x * aspect, p.y);

                    float rd = length(pa);

                    float rd2 = rd * rd;
                    float rd4 = rd2 * rd2;
                    float rd6 = rd4 * rd2;
                    float rd8 = rd4 * rd4;

                    float c1 = _C1;
                    float c2 = _C2;

                    float numerator =
                          c1 * rd2
                        + c2 * rd4
                        + (c1 * c1) * rd4
                        + (c2 * c2) * rd8
                        + 2.0 * c1 * c2 * rd6;

                    float denominator = 1.0 + 4.0 * c1 * rd2 + 6.0 * c2 * rd4;

                    float Delta = (denominator != 0.0) ? (numerator / denominator) : 0.0;

                    // when c1=c2=0, ru ≈ rd * (1 - delta):
                    float ru = rd * (1.0 - Delta);

                    // Map display radius rd -> sample radius ru
                    float scale = (rd > 1e-8) ? (ru / rd) : 1.0;

                    float2 pa_u = pa * scale;
                    float2 p_u = float2(pa_u.x / aspect, pa_u.y);

                    float2 uvSample = 0.5 + p_u;

                    if (uvSample.x < 0 || uvSample.x > 1 || uvSample.y < 0 || uvSample.y > 1)
                        return fixed4(0,0,0,1);

                    return tex2D(_MainTex, uvSample);
                }
                ENDCG
            }
        }
}
