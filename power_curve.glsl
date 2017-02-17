//http://www.iquilezles.org/www/articles/functions/functions.htm
float pcurve( float x, float a, float b )
{
    float k = pow(a + b, a + b) / (pow(a, a) * pow(b, b));
    return k * pow(x, a) * pow(1.0 - x, b);
}
