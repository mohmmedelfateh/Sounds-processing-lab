prompt = {'Enter Size Frame:','Enter Number Your Frame:', 'Enter Level Crossing :'};
dlgtitle = 'Input';
dims = [1 70];
definput = {'0.3','6','0.01'};
answer = inputdlg(prompt,dlgtitle,dims,definput);
SizeFrame = str2double(answer{1,1});
FrameNumber = str2double(answer{2,1});
Level = str2double(answer{3,1});

Frames = CreateMyFramesBySize('Recording.m4a',SizeFrame);

P = tiledlayout(3,1);
nexttile
ZeroCrossingCalc(Frames,FrameNumber);
title('Zero Crossing');
nexttile
LevelCrossingCalc( Frames,FrameNumber, Level );
title('Level Crossing');
nexttile
[r]= Quantization(16,Frames(FrameNumber,:),"QW");
title('Quantizat8on');

sound(Frames(FrameNumber,:));
pause(2);
sound(r);

