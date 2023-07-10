clear
clc
frame = [3 10 4 -1 3 -7 -10 6 8-1 2 -1 -8 10 8 -7 6];
levelp = 4;
leveln = -4;

X=zeros(1,length(frame));

for x= 1 : length(frame)
    if frame(x) <= levelp && frame(x) >= leveln
        X(x)=0;
    else
        X(x) = frame(x);
    end
end

LCR = 0;
F1=X(1);
for y= 1 : length(X)
    if X(y) ~= 0
        if (F1*X(y))<0
            LCR = LCR + 1;
        end
    F1 =X(y);
    end
end

[~,count] = zerocrossrate(frame,Method="comparison", ...
    Level=(levelp+leveln)/2,Threshold=(levelp-leveln)/2);
plot(frame)

yline([levelp leveln],"-r")
xticklabels(frame)
