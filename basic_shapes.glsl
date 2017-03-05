//around center
float circle( vec2 uv, float radius )
{
	return 1.0 -length( uv / radius );
}

//improves performance over sqrt based functions
float circle(in vec2 _st, in float _radius){
    vec2 dist = _st-vec2(0.5);
	return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(dist,dist)*4.0);
}


//x,y,r
float circ(vec2 uv, vec2 center, float radius){
    return step(length(uv - center), radius);
}


//x,y,x2,y2
float rect(vec2 uv, vec4 rect){
    vec2 hv = step(rect.xy, uv) * step(uv, rect.zw);
    return hv.x * hv.y;	
}
//x,y,w,h
float rect(vec2 uv, vec4 rect){
    vec2 hv = step(rect.xy, uv) * step(uv, rect.xy + rect.zw);
    return hv.x * hv.y;	
}


//N equal faces
int N=7;
float a=atan(c.x,c.y)+.2;
float b=6.28319/float(N);
f=vec4(vec3(smoothstep(.5,.51, cos(floor(.5+a/b)*b-a)*length(c.xy))),1.);
