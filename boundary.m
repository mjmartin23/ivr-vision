% connects all close objects that may have been disconnected by median
% filter, then returns a matrix L that has each object segmented into
% different colors

function [out,L] = boundary(I)
    SE = strel('line',10,90);
    closed = imclose(I,SE);
   
    [B,L] = bwboundaries(closed,'noholes');
    out = label2rgb(L,@jet,[.5 .5 .5]);
    
end