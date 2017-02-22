float map(float min1, float max1, float min2, float max2, float val){
    return ((val - min1) / (max1 - min1)) * (max2 - min2) + min2;
}
vec2 map(float min1, float max1, float min2, float max2, vec2 val){
    return vec2( map(min1, max1, min2, max2, val.x), map(min1, max1, min2, max2, val.y) );
}
