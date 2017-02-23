//patterns seem visible
float hash( float n ){
    return fract(sin(n)*43758.5453);
}

float noise( vec3 x ){
    // The noise function returns a value in the range -1.0f -> 1.0f

    vec3 p = floor(x);
    vec3 f = fract(x);

    f       = f*f*(3.0-2.0*f);
    float n = p.x + p.y*57.0 + 113.0*p.z;

    return mix(mix(mix( hash(n+0.0), hash(n+1.0),f.x),
                   mix( hash(n+57.0), hash(n+58.0),f.x),f.y),
               mix(mix( hash(n+113.0), hash(n+114.0),f.x),
                   mix( hash(n+170.0), hash(n+171.0),f.x),f.y),f.z);
}
gl_FragColor = vec4(noise(gl_FragCoord.xyz));


//well spread
float rand(vec2 n) {
  //This is just a compounded expression to simulate a random number based on a seed given as n
  	return fract(cos(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

float noise(vec2 n) {
  //Uses the rand function to generate noise
	  const vec2 d = vec2(0.0, 1.0);
	  vec2 b = floor(n), f = smoothstep(vec2(0.0), vec2(1.0), fract(n));
	  return mix(mix(rand(b), rand(b + d.yx), f.x), mix(rand(b + d.xy), rand(b + d.yy), f.x), f.y);
}
gl_FragColor = vec4(noise(gl_FragCoord.xy));


//sharp but well spread
float poltergeist(in vec2 coordinate, in float seed){
    return fract(sin(dot(coordinate*seed, vec2(12.9898, 78.233)))*43758.5453);
}
gl_FragColor = vec4(poltergeist(gl_FragCoord.xy, time));
