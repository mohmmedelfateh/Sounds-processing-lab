clear
clc
[data,fs] = audioread("Recording.m4a");
frame_duration = 0.2;


framelen = frame_duration*fs;
numframes = floor(length(data)/framelen);
temp = 0;
frames=[];
for i = 1 : numframes
    frames(i,:)=data(temp+1 : temp+framelen);
    temp = temp + framelen;
end

% Final output is frames