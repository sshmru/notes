//http://www.iquilezles.org/www/articles/functions/functions.htm

float almostIdentity( float x, float m, float n )
{
    if( x>m ) return x;

    const float a = 2.0f*n - m
    const float b = 2.0f*m - 3.0f*n;
    const float t = x/m;

    return (a*t + b)*t*t + n;
}
