mat2 rotate2d(float _angle){
    return mat2(cos(_angle),-sin(_angle),
                sin(_angle),cos(_angle));
}

vec2 st = gl_FragCoord.xy/u_resolution.xy;
vec2 p =  st - vec2(0.5);
p*= rotate2d(PI*0.1);
