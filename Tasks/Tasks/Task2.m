array = [3 10 4 -1 3 -7 -10 6 8 -1 2 -1 -8 10 8 -7];
N_bit = 2;

t = tiledlayout(3,1);
nexttile
Quantization(N_bit,array,"QW");
title('Quantization');
nexttile
ZeroCrossingCalc(array);
title('Zero Crossing');
nexttile
LevelCrossingCalc( array,3);
title('Level Crossing');
