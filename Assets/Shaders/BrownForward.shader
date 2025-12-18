Shader "Custom/BrownForward"
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

                    // Center coords in [-0.5..0.5]
                    float2 p = uv - 0.5;

                    // Aspect-correct so "radius" is circular on screen
                    float aspect = _ScreenParams.x / _ScreenParams.y;
                    float2 pa = float2(p.x * aspect, p.y);

                    float ru = length(pa);

                    // Forward Brown model
                    float ru2 = ru * ru;
                    float ru3 = ru2 * ru;
                    float ru5 = ru3 * ru2;

                    float rd = ru + _C1 * ru3 + _C2 * ru5;

                    // Scale radius while keeping angle same
                    float scale = (ru > 1e-8) ? (rd / ru) : 1.0;

                    // Apply in aspect-correct space, then un-aspect back
                    float2 pa_d = pa * scale;
                    float2 p_d = float2(pa_d.x / aspect, pa_d.y);

                    float2 uvDistorted = 0.5 + p_d;

                    // set black for outside samples
                    if (uvDistorted.x < 0 || uvDistorted.x > 1 || uvDistorted.y < 0 || uvDistorted.y > 1)
                        return fixed4(0,0,0,1);

                    return tex2D(_MainTex, uvDistorted);
                }
                ENDCG
            }
        }
}
