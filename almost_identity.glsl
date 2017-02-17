//http://www.iquilezles.org/www/articles/functions/functions.htm

float almostIdentity( float x, float m, float n )
{
    if( x>m ) return x;

    float a = 2.0 * n - m;
    float b = 2.0 * m - 3.0 * n;
    float t = x/m;

    return (a*t + b)*t*t + n;
}
//float y = almostIdentity(x, 0.15, 0.1);
