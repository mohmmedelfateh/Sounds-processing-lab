clear
clc
frame = [3 10 4 -1 3 -7 -10 6 8-1 2 -1 -8 10 8 -7];
ZCR = 0;
for x=1:length(frame)-1
    if frame(x)*frame(x+1)<0
        ZCR = ZCR +1;
    end
end
disp(ZCR)
[~,count] = zerocrossrate(frame,InitialState=1,Method="comparison");
disp(count)
plot(frame,"*-")
hold on
xticklabels(frame)