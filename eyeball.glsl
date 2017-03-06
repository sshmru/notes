//taken from inigo quilez tutorial
//https://www.youtube.com/watch?v=emjuqqyq_qc

#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform float u_time;

vec2 hash( vec2 x )  // replace this by something better
{
    const vec2 k = vec2( 0.3183099, 0.3678794 );
    x = x*k + k.yx;
    return -1.0 + 2.0*fract( 16.0 * k*fract( x.x*x.y*(x.x+x.y)) );
}

float noise( in vec2 p )
{
    vec2 i = floor( p );
    vec2 f = fract( p );
	
	vec2 u = f*f*(3.0-2.0*f);

    return mix( mix( dot( hash( i + vec2(0.0,0.0) ), f - vec2(0.0,0.0) ), 
                     dot( hash( i + vec2(1.0,0.0) ), f - vec2(1.0,0.0) ), u.x),
                mix( dot( hash( i + vec2(0.0,1.0) ), f - vec2(0.0,1.0) ), 
                     dot( hash( i + vec2(1.0,1.0) ), f - vec2(1.0,1.0) ), u.x), u.y);
}

mat2 m = mat2(0.8, 0.6, -0.6, 0.8);

float fbm( vec2 p){
    float f = 0.0;
    f += 0.500 * noise( p ); p*=m*2.02;
    f += 0.250 * noise( p ); p*=m*2.03;
    f += 0.125 * noise( p ); p*=m*2.01;
    f += 0.0625 * noise( p ); p*=m*2.04;
    f /= 0.9375;
    return f;
}


void main() {
	vec2 q = gl_FragCoord.xy/u_resolution;
    vec2 p = -1.0 + 2.0 * q;
    p *= u_resolution.x/u_resolution.y;
    
    //float background = smoothstep(-0.25, 0.25,  p.x);
    
    //p.x -= 0.2;
    float r = sqrt( dot(p,p));
    float a = atan( p.y, p.x);
    
    float ss = 0.5 + 0.5 * sin(8.0 * u_time);
    float anim = 1.0 + 0.1 * ss * clamp(1.0 - r, 0.0, 1.0);
    r *= anim;
       
	vec3 col = vec3(1.0);
    if(r < 0.8){
        col = vec3(0.2, 0.3, 0.4);
        
        float f = fbm( p * 5.0 );
        col = mix( col, vec3(0.2, 0.5, 0.4), f);
        
        f = 1.0 - smoothstep( 0.2, 0.5, r);
        col = mix(col, vec3(0.9, 0.6, 0.2), f);
        
        
        a += 0.3 * fbm( 5.0 * p );
        
        f = smoothstep(0.0, .7, fbm( vec2(r*2.0, a*30.0) ));
        col = mix(col, vec3(1.0), f);
                
        f = smoothstep(0.0, .6, fbm( vec2(r*3.0, a*10.0) ));
        col *= 1. - f * 0.5;
        
        f = smoothstep(0.6, .8, r);
        col *= 1. - f * 0.5;
        
        f = smoothstep(0.2, 0.25, r);
        col *= f;
        
        f = 1.0 - smoothstep(0.0, 0.6, length (p - vec2(0.24, 0.3)));
        col += vec3(1.0, 0.9, 0.8) * f * 0.9;
        
        f = smoothstep( 0.75, 0.8, r);
        col = mix( col, vec3(1.0), f);
    }

    
    //col *= background;
    
	gl_FragColor = vec4(col,1.0);
}


