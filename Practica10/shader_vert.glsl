#define PROCESSING_COLOR_SHADER

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

uniform vec3 lightNormal[8];

attribute vec4 vertex;

varying float height;

uniform vec2 u_resolution;
uniform vec2 position;

vec2 noise(vec2 p)
{
    p = mod(p,289.);
    float x = (34. * p.x + 1.) * mod(p.x, 289.) + p.y;
    x = (34. * x + 1.) * mod(x, 289.);
    x = fract(x / 41.) * 2. - 1.;
    return normalize(vec2(x - floor(x + 0.5), abs(x) - 0.5));
}

float gradientNoise(vec2 p)
{
    vec2 ip = floor(p);
    vec2 fp = fract(p);
    float d00 = dot(noise(ip), fp);
    float d01 = dot(noise(ip + vec2(0, 1)), fp - vec2(0, 1));
    float d10 = dot(noise(ip + vec2(1, 0)), fp - vec2(1, 0));
    float d11 = dot(noise(ip + vec2(1, 1)), fp - vec2(1, 1));
    fp = fp * fp * fp * (fp * (fp * 6. - 15.) + 10.);
    return mix(mix(d00, d01, fp.y), mix(d10, d11, fp.y), fp.x);
}

void main() {
  
  height = gradientNoise(3.*vec2(vertex[0] + position.x,vertex.y+position.y)/u_resolution);
  
  if (height<0) height*=0.6;
  
  gl_Position = transform * (vertex) + vec4(0., height*400. , 0., 0.);
}
