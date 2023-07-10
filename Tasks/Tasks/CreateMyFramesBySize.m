function [frame] = CreateMyFramesBySize(AudioPath,FrameSize)
[data,sample_rate] = audioread(AudioPath);
frame_num_sample=round(FrameSize*sample_rate);
num_frame=floor(length(data)/frame_num_sample);
temp=0;
frame=zeros(num_frame,frame_num_sample);
for i=1 : num_frame 
    frame(i,:) = data(temp+1 : temp+frame_num_sample );
    temp=temp+frame_num_sample;
end

end