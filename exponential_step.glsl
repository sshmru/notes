//http://www.iquilezles.org/www/articles/functions/functions.htm
	
float expStep( float x, float k, float n )
{
    return exp( -k * pow(x , n) );
}
//float y = expStep(x, 4., 5.);
