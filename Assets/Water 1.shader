// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:1,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:False,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9711967,fgcg:0.9779412,fgcb:0.8556985,fgca:1,fgde:3E-05,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-6964-OUT,spec-2543-OUT,gloss-7034-OUT,normal-1703-OUT,alpha-931-OUT,refract-4762-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32023,y:32300,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6487889,c2:0.7736993,c3:0.9191176,c4:1;n:type:ShaderForge.SFN_DepthBlend,id:1642,x:32039,y:32993,varname:node_1642,prsc:2|DIST-3966-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3966,x:31876,y:32993,ptovrint:False,ptlb:Blend,ptin:_Blend,varname:node_3966,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Vector1,id:2543,x:32527,y:32554,varname:node_2543,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:7026,x:32039,y:32914,ptovrint:False,ptlb:Transparency,ptin:_Transparency,varname:node_7026,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Subtract,id:4028,x:32383,y:32974,varname:node_4028,prsc:2|A-7026-OUT,B-1865-OUT;n:type:ShaderForge.SFN_OneMinus,id:1865,x:32194,y:32993,varname:node_1865,prsc:2|IN-1642-OUT;n:type:ShaderForge.SFN_Clamp01,id:931,x:32553,y:32974,varname:node_931,prsc:2|IN-7026-OUT;n:type:ShaderForge.SFN_Lerp,id:6964,x:32406,y:32481,varname:node_6964,prsc:2|A-1304-RGB,B-3684-RGB,T-1865-OUT;n:type:ShaderForge.SFN_Color,id:3684,x:32023,y:32463,ptovrint:False,ptlb:Color2,ptin:_Color2,varname:node_3684,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Slider,id:7034,x:32034,y:32629,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_7034,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_ViewPosition,id:9771,x:31104,y:33165,varname:node_9771,prsc:2;n:type:ShaderForge.SFN_FragmentPosition,id:5880,x:31110,y:33279,varname:node_5880,prsc:2;n:type:ShaderForge.SFN_Subtract,id:1518,x:31301,y:33222,varname:node_1518,prsc:2|A-9771-XYZ,B-5880-XYZ;n:type:ShaderForge.SFN_Normalize,id:4240,x:31474,y:33222,varname:node_4240,prsc:2|IN-1518-OUT;n:type:ShaderForge.SFN_NormalVector,id:8952,x:31474,y:33076,prsc:2,pt:False;n:type:ShaderForge.SFN_NormalVector,id:8419,x:31753,y:33432,prsc:2,pt:False;n:type:ShaderForge.SFN_Transform,id:1652,x:31914,y:33432,varname:node_1652,prsc:2,tffrom:0,tfto:1|IN-8419-OUT;n:type:ShaderForge.SFN_ComponentMask,id:4563,x:32085,y:33432,varname:node_4563,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1652-XYZ;n:type:ShaderForge.SFN_Slider,id:472,x:31918,y:33356,ptovrint:False,ptlb:Refraction,ptin:_Refraction,varname:node_472,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.4023438,max:1;n:type:ShaderForge.SFN_Multiply,id:6697,x:32267,y:33372,varname:node_6697,prsc:2|A-4563-OUT,B-472-OUT;n:type:ShaderForge.SFN_Dot,id:6171,x:31671,y:33135,varname:node_6171,prsc:2,dt:0|A-8952-OUT,B-4240-OUT;n:type:ShaderForge.SFN_Clamp01,id:9574,x:31829,y:33135,varname:node_9574,prsc:2|IN-6171-OUT;n:type:ShaderForge.SFN_OneMinus,id:769,x:31997,y:33135,varname:node_769,prsc:2|IN-9574-OUT;n:type:ShaderForge.SFN_Clamp01,id:8985,x:32152,y:33135,varname:node_8985,prsc:2|IN-769-OUT;n:type:ShaderForge.SFN_Vector1,id:3393,x:32139,y:33257,varname:node_3393,prsc:2,v1:2;n:type:ShaderForge.SFN_Power,id:373,x:32316,y:33135,varname:node_373,prsc:2|VAL-8985-OUT,EXP-3393-OUT;n:type:ShaderForge.SFN_Multiply,id:4762,x:32490,y:33135,varname:node_4762,prsc:2|A-373-OUT,B-6697-OUT;n:type:ShaderForge.SFN_Tex2d,id:7231,x:31476,y:32581,varname:node_7231,prsc:2,tex:d5ce8e65a7077394aa1691ecd68dd1d0,ntxv:3,isnm:True|UVIN-5546-UVOUT,TEX-1031-TEX;n:type:ShaderForge.SFN_Panner,id:5546,x:31215,y:32625,varname:node_5546,prsc:2,spu:1,spv:0|UVIN-5519-UVOUT,DIST-8898-OUT;n:type:ShaderForge.SFN_TexCoord,id:5519,x:31049,y:32625,varname:node_5519,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:264,x:31215,y:32770,varname:node_264,prsc:2,spu:-1,spv:0|UVIN-5601-UVOUT,DIST-8898-OUT;n:type:ShaderForge.SFN_TexCoord,id:5601,x:31049,y:32770,varname:node_5601,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:8089,x:31476,y:32726,varname:_node_7231_copy,prsc:2,tex:d5ce8e65a7077394aa1691ecd68dd1d0,ntxv:3,isnm:True|UVIN-264-UVOUT,TEX-1031-TEX;n:type:ShaderForge.SFN_Multiply,id:4816,x:31672,y:32672,varname:node_4816,prsc:2|A-7231-RGB,B-8089-RGB;n:type:ShaderForge.SFN_Time,id:1159,x:31059,y:32927,varname:node_1159,prsc:2;n:type:ShaderForge.SFN_Tex2dAsset,id:1031,x:30864,y:32736,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_1031,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:d5ce8e65a7077394aa1691ecd68dd1d0,ntxv:3,isnm:True;n:type:ShaderForge.SFN_ComponentMask,id:3157,x:31857,y:32637,varname:node_3157,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4816-OUT;n:type:ShaderForge.SFN_Slider,id:4000,x:31672,y:32828,ptovrint:False,ptlb:Norm Strengh,ptin:_NormStrengh,varname:node_4000,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:5;n:type:ShaderForge.SFN_Vector1,id:4332,x:31672,y:32899,varname:node_4332,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:870,x:32034,y:32716,varname:node_870,prsc:2|A-3157-OUT,B-4000-OUT;n:type:ShaderForge.SFN_Append,id:1703,x:32241,y:32716,varname:node_1703,prsc:2|A-870-OUT,B-4332-OUT;n:type:ShaderForge.SFN_Divide,id:8898,x:31254,y:32927,varname:node_8898,prsc:2|A-1159-TSL,B-5220-OUT;n:type:ShaderForge.SFN_Vector1,id:5220,x:31049,y:33052,varname:node_5220,prsc:2,v1:10;proporder:1304-3684-3966-7026-7034-472-1031-4000;pass:END;sub:END;*/

Shader "Shader Forge/Water" {
    Properties {
        _Color ("Color", Color) = (0.6487889,0.7736993,0.9191176,1)
        _Color2 ("Color2", Color) = (1,1,1,1)
        _Blend ("Blend", Float ) = 0
        _Transparency ("Transparency", Range(0, 1)) = 0
        _Gloss ("Gloss", Range(0, 1)) = 0
        _Refraction ("Refraction", Range(-1, 1)) = 0.4023438
        _Normal ("Normal", 2D) = "bump" {}
        _NormStrengh ("Norm Strengh", Range(0, 5)) = 1
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "DEFERRED"
            Tags {
                "LightMode"="Deferred"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_DEFERRED
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile ___ UNITY_HDR_ON
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform float _Blend;
            uniform float _Transparency;
            uniform float4 _Color2;
            uniform float _Gloss;
            uniform float _Refraction;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormStrengh;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 projPos : TEXCOORD5;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            void frag(
                VertexOutput i,
                out half4 outDiffuse : SV_Target0,
                out half4 outSpecSmoothness : SV_Target1,
                out half4 outNormal : SV_Target2,
                out half4 outEmission : SV_Target3 )
            {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1159 = _Time + _TimeEditor;
                float node_8898 = (node_1159.r/10.0);
                float2 node_5546 = (i.uv0+node_8898*float2(1,0));
                float3 node_7231 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_5546, _Normal)));
                float2 node_264 = (i.uv0+node_8898*float2(-1,0));
                float3 _node_7231_copy = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_264, _Normal)));
                float3 normalLocal = float3(((node_7231.rgb*_node_7231_copy.rgb).rg*_NormStrengh),1.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
////// Lighting:
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float perceptualRoughness = 1.0 - _Gloss;
                float roughness = perceptualRoughness * perceptualRoughness;
/////// GI Data:
                UnityLight light; // Dummy light
                light.color = 0;
                light.dir = half3(0,1,0);
                light.ndotl = max(0,dot(normalDirection,light.dir));
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = 1;
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
////// Specular:
                float3 specularColor = 0.0;
                float specularMonochrome;
                float node_1865 = (1.0 - saturate((sceneZ-partZ)/_Blend));
                float3 diffuseColor = lerp(_Color.rgb,_Color2.rgb,node_1865); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
/////// Diffuse:
/// Final Color:
                outDiffuse = half4( diffuseColor, 1 );
                outSpecSmoothness = half4( specularColor, gloss );
                outNormal = half4( normalDirection * 0.5 + 0.5, 1 );
                outEmission = half4(0,0,0,1);
                #ifndef UNITY_HDR_ON
                    outEmission.rgb = exp2(-outEmission.rgb);
                #endif
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform float _Blend;
            uniform float _Transparency;
            uniform float4 _Color2;
            uniform float _Gloss;
            uniform float _Refraction;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormStrengh;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 projPos : TEXCOORD5;
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1159 = _Time + _TimeEditor;
                float node_8898 = (node_1159.r/10.0);
                float2 node_5546 = (i.uv0+node_8898*float2(1,0));
                float3 node_7231 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_5546, _Normal)));
                float2 node_264 = (i.uv0+node_8898*float2(-1,0));
                float3 _node_7231_copy = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_264, _Normal)));
                float3 normalLocal = float3(((node_7231.rgb*_node_7231_copy.rgb).rg*_NormStrengh),1.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float perceptualRoughness = 1.0 - _Gloss;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = 0.0;
                float specularMonochrome;
                float node_1865 = (1.0 - saturate((sceneZ-partZ)/_Blend));
                float3 diffuseColor = lerp(_Color.rgb,_Color2.rgb,node_1865); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                half surfaceReduction;
                #ifdef UNITY_COLORSPACE_GAMMA
                    surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;
                #else
                    surfaceReduction = 1.0/(roughness*roughness + 1.0);
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                indirectSpecular *= surfaceReduction;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor,saturate(_Transparency));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float4 _Color;
            uniform float _Blend;
            uniform float _Transparency;
            uniform float4 _Color2;
            uniform float _Gloss;
            uniform float _Refraction;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _NormStrengh;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 projPos : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1159 = _Time + _TimeEditor;
                float node_8898 = (node_1159.r/10.0);
                float2 node_5546 = (i.uv0+node_8898*float2(1,0));
                float3 node_7231 = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_5546, _Normal)));
                float2 node_264 = (i.uv0+node_8898*float2(-1,0));
                float3 _node_7231_copy = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_264, _Normal)));
                float3 normalLocal = float3(((node_7231.rgb*_node_7231_copy.rgb).rg*_NormStrengh),1.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float perceptualRoughness = 1.0 - _Gloss;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = 0.0;
                float specularMonochrome;
                float node_1865 = (1.0 - saturate((sceneZ-partZ)/_Blend));
                float3 diffuseColor = lerp(_Color.rgb,_Color2.rgb,node_1865); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse + specular;
                fixed4 finalRGBA = fixed4(finalColor * saturate(_Transparency),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
