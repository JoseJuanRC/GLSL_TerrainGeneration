#ifdef GL_ES
precision mediump float;
#endif

varying float height;

uniform vec3 water;
uniform vec3 deepWater;
uniform vec3 grass;
uniform vec3 mountain;
uniform vec3 rocks;
uniform vec3 snow;

uniform vec2 u_resolution;

uniform vec2 position;
void main() {  
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    vec3 color = vec3(height);
    
    
    if (height < -0.2) color=mix(water, deepWater, (-height-0.2)*15.);
    else if (height < 0.1)  {
      if (height>-0.1) {
        color = mix(grass, mountain, (height+0.1)*5.);
      } else
        color = grass;
    }
    else if(height < 0.5) {
      if (height>0.45) {
        color = mix(rocks, snow, (height-0.45)*20.);
      } else
        color = mix(mountain, rocks, (height-0.1)*2.86);
    
    }
    else color = snow;
    
    gl_FragColor = vec4(color.r, color.g, color.b, 1.);
}
