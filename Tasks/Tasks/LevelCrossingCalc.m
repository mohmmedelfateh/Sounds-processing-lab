function [ lcf, Level ] = LevelCrossingCalc( Frames,FrameNumber, Level )
if nargin > 3
    error('This too many values,Pls try again');
end

switch nargin
    case 2
        Level = FrameNumber;
        FrameNumber = 1;
end
Frame=Frames(FrameNumber,:);

Level2 = -Level;
plot(Frame);
yline([Level Level2],'-.r',{'Max','Min'});
    % check errors:
    if  (~ismatrix(Frame)) 
        error( 'Wrong input parameters!' );
    end
    
    % calculate lcf for each threshold:
    for i = 1:length( Level )
        tmp = ( Frame > Level(i) );
        tmp = diff( tmp );
        lcf( i ) = length(find(tmp==1));
    end
disp(['Level Crossing  = ',int2str(lcf)])
end
    