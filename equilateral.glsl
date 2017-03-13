// Author:
// Title:

#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359
#define TWO_PI 6.28318530718

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


float ctrian(float x){
    float s3 = sqrt(3.);
	return abs(mod(x*s3-s3/2., s3*2.)-s3)-s3/2.;
}
float strian(float x){
    return max(abs(mod(x*3., 6.)-3.)-2., -.5);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;

    vec2 p = st - vec2(0.5);
    p*=5.;
    
    vec3 color = vec3(1.);
    
    float d = 0.0;
    int N = 3;

    // Angle and radius from the current pixel
    float a = atan(st.x,st.y)+PI;
    float r = TWO_PI/float(N);

    // Shaping function that modulate the distance
    d = cos(floor(.5+a/r)*r-a)*length(st);
    
    vec2 q = vec2(1.);
    for(float i = 0.; i < 2.; i+=.1){
        q = vec2((ctrian(u_time + i)) , (strian(u_time+ i)))*0.99;

   		color = color * vec3(smoothstep(0.05, 0.06, distance(p, q)));        
    }
    
    
    gl_FragColor = vec4(color,1.0);
}
