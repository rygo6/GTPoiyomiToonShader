float _Key0;
float _Key1;
float _Key2;
float _Key3;

float4 modelDecode(float4 vertex, float3 normal, float2 uv0, float2 uv1)
{
    // add .5 to fix odd offset from vrc parameter sync
    float key0 = ((int)(_Key0 + .5));
    float key1 = ((int)(_Key1 + .5));
    float key2 = ((int)(_Key2 + .5));
    float key3 = ((int)(_Key3 + .5));

    // if key is 0, allow it to be as such, so it can render nor-crypted avatars correctly
    // by setting the keys to 0 on the shader
    if (key0 < 0 || key0 > 0 || key1 < 0 || key1 > 0 || key2 < 0 || key2 > 0 || key3 < 0 || key3 > 0)
    {
        // round to three to minimize potential of parameter off sync
        key0 = ((int)(key0 / 3)) * 3 + 1;
        key1 = ((int)(key1 / 3)) * 3 + 1;
        key2 = ((int)(key2 / 3)) * 3 + 1;
        key3 = ((int)(key3 / 3)) * 3 + 1;
    }

    key0 *= 1;
    key1 *= 2;
    key2 *= 3;
    key3 *= 4;
    
    vertex.xyz -= normal * uv0.x * (sin((key2 - key1) * 2) * cos(key3 - key0));
    vertex.xyz -= normal * uv0.y * (sin((key3 - key0) * 3) * cos(key2 - key1));
    vertex.xyz -= normal * uv1.x * (sin((key0 - key3) * 4) * cos(key1 - key2));
    vertex.xyz -= normal * uv1.y * (sin((key1 - key2) * 5) * cos(key0 - key3));
    
    return vertex;
}
