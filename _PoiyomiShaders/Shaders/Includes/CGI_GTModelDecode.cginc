float _Key0;
float _Key1;
float _Key2;
float _Key3;

float4 modelDecode(float4 vertex, float3 normal, float2 uv0, float2 uv1)
{
    float key0 = _Key0 * 1;
    float key1 = _Key1 * 2;
    float key2 = _Key2 * 3;
    float key3 = _Key3 * 4;
    
    vertex.xyz -= normal * uv0.x * (sin((key2 - key1) * 2) * cos(key3 - key0));
    vertex.xyz -= normal * uv0.y * (sin((key3 - key0) * 3) * cos(key2 - key1));
    vertex.xyz -= normal * uv1.x * (sin((key0 - key3) * 4) * cos(key1 - key2));
    vertex.xyz -= normal * uv1.y * (sin((key1 - key2) * 5) * cos(key0 - key3));
    
    return vertex;
}