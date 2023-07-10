function [index] = Quantization(N_bit,array,plot)
if nargin == 2
    plot = "QL";
end
Max = max(array);
Min = min(array);
temp_min = Min;
N = 2^N_bit;
intervals = zeros(N,[]);
step = (Max - Min)/N;
AVGs = zeros(N,1);
bit_stream= [];
Error = 0;
bits = [];
index = [];

for v = 1 : N
    temp_Max = temp_min + step;
    intervals(v,1) = temp_min;
    intervals(v,2) = temp_Max;
    temp_min = temp_Max;
end
for n = 1 : length(intervals) 
      avg = (intervals(n,1) + intervals(n,2))/2;
      AVGs(n) = avg;    
end
for d = 0 : N - 1
    bit = de2bi(d,N_bit,'left-msb');
    bits =[bits;bit];
end
mytable = table(bits,intervals,AVGs);

intervals(end)=intervals(end)+1;
for u = 1:length(array)
    for f = 1 : length(intervals)
        n = f-1;
        if  array(u) >= intervals(f,1) && array(u) < intervals(f,2)
            bit_stream = [bit_stream;[de2bi(n,N_bit,'left-msb')]];
            index = [index;n];
            Error = Error +  abs( array(u) - AVGs(f));
        end
    end
end
disp(mytable);
disp("Bit Stream: ");
disp(bit_stream);
disp("Error: ");
disp(Error);
if plot == "QW"
    stem(index,"filled","b");
    title('Quantization Wave');
else 
    stem(array,index,"filled","b");
    title('Quantization Level');


end