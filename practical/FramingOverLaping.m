clear
clc
[data,fs] = audioread("Recording.m4a");
frame_duration = 0.2;
overlabing_duration = 0.005;
lengthoverlabing = fs*overlabing_duration;
lengthframe = frame_duration*fs;
numframe = 1+floor((length(data)-lengthframe)/(lengthframe-lengthoverlabing));
frames=zeros(numframe,lengthframe);
temp = 0;
for x= 1 : numframe
    frames(x,:)=data(temp+1 : temp+lengthframe);
    temp =(temp + lengthframe)-lengthoverlabing;
end

% Final output is frames