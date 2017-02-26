float corners = 4.0;
float curve = 2.0;
float innerRadius = 2.0;
float fun(float r, float a){
	return r - 1.0 + sin(corners * a + curve *r * r) / innerRadius;
}

float plot(vec2 p){
	float v = fun(p.x, p.y);
	return smoothstep(0.19, 0.20, abs(v));
}

void main( void ) {

	vec2 pos = ( gl_FragCoord.xy / resolution.xy ) *20.0 - 10.0;
	pos.y *= resolution.y/ resolution.x;
	
 	vec3 color = vec3(plot(
		vec2(sqrt(pos.x * pos.x + pos.y * pos.y), atan(pos.x, pos.y))
	));
	
	gl_FragColor = vec4( color, 1.0 );
}
