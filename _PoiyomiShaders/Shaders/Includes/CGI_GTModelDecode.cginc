float _Key0;
float _Key1;
float _Key2;
float _Key3;
float _Key4;
float _Key5;

float4 modelDecode(float4 vertex, float3 normal, float2 uv0, float2 uv1)
{
    // add .5 to fix odd offset from vrc parameter sync
    float key0 = ((int)(_Key0 + .5));
    float key1 = ((int)(_Key1 + .5));
    float key2 = ((int)(_Key2 + .5));
    float key3 = ((int)(_Key3 + .5));
    float key4 = ((int)(_Key4 + .5));
    float key5 = ((int)(_Key5 + .5));

    // if key is 0, allow it to be as such, so it can render nor-crypted avatars correctly
    // by setting the keys to 0 on the shader
    if (key0 > 0)
    {
        // round to three to minimize potential of parameter off sync
        key0 = ((int)(key0 / 3)) * 3 + 1;
        key1 = ((int)(key1 / 3)) * 3 + 1;
        key2 = ((int)(key2 / 3)) * 3 + 1;
        key3 = ((int)(key3 / 3)) * 3 + 1;
        key4 = ((int)(key4 / 3)) * 3 + 1;
        key5 = ((int)(key5 / 3)) * 3 + 1;
    }

    key0 *= 1.234567;
    key1 *= 1.469134;
    key2 *= 1.703701;
    key3 *= 1.938268;
    key4 *= 2.172835;
    key5 *= 2.407402;
    
    vertex.xyz -= normal * uv0.x * (sin((key0 - key5) * 0.234567) * cos(key2 - key3));
    vertex.xyz -= normal * uv0.y * (sin((key1 - key4) * 0.469134) * cos(key1 - key4));
    vertex.xyz -= normal * uv0.x * (sin((key2 - key3) * 0.703701) * cos(key0 - key5));
    vertex.xyz -= normal * uv1.y * (sin((key3 - key2) * 0.938268) * cos(key5 - key0));
    vertex.xyz -= normal * uv1.x * (sin((key4 - key1) * 1.172835) * cos(key4 - key1));
    vertex.xyz -= normal * uv1.y * (sin((key5 - key0) * 1.407402) * cos(key3 - key2));
    
    return vertex;
}