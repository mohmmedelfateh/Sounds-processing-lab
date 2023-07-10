t = (0:0.1:50);
x = cos(0.1*pi*t);
P = tiledlayout(2,2);
nexttile
plot(t,x);
title('Original Wave');
nexttile
Quantization(10,x,"QW");
title('Quantization');
nexttile
ZeroCrossingCalc(x);
title('Zero Crossing');
nexttile
LevelCrossingCalc( x, 0.5 );
title('Level Crossing');

