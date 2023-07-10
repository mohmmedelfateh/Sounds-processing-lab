clear
clc
frame = [3 10 4 -1 3 -7 -10 6 8-1 2 -1 -8 10 8 -7];

L = length(frame);
sum = 0;
for x = 1 : L
    sum = sum + frame(x)^2;
end

Short_Time_Energy = sum/L;
disp(Short_Time_Energy)

Short_Time_Energy2 = bandpower(frame);
disp(Short_Time_Energy2)