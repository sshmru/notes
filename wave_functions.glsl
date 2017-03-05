http://stackoverflow.com/questions/1073606/is-there-a-one-line-function-that-generates-a-triangle-wave/1073634#1073634

float period = 6.0;
float max = 3.0;
flaot min = 0;

triangle
y = abs((x++ % period) - max);

square
y = (x++ % period) < max ? max : min;

float squareWave(float x){
    float base = 0.5;
    float interspace = -.5;
    float height = 0.1;
    return  base + step(interspace, cos(x*10.))*height;
}


triangle curved bottom (u-wave)
y = pow(abs((x++ % 6) - 3), 2.0);

triangle curved top (reverse-u-wave)
y = pow(abs((x++ % 6) - 3), 0.5);
