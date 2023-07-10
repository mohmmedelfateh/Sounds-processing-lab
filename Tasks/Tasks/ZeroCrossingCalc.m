function [ZeroCrossing] = ZeroCrossingCalc(Frames,FrameNumber)
if nargin > 2
    error('This too many values,Pls try again');
end

switch nargin
    case 1
        FrameNumber = 1;
end
ZeroCrossing = 0;
Frame=Frames(FrameNumber,:);
rate = zerocrossrate(Frame);
plot(Frame);
yline(0,'-.r',{'Zero'});
for j=1 : length(Frame)-1
    if (Frame(j)*Frame(j+1)<0)
        ZeroCrossing=ZeroCrossing+1;
    end
end

disp(['Zero Crossing  = ',int2str(ZeroCrossing)])
disp(['Zero Crossing rate  = ',num2str(rate)])

end