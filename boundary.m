function out = boundary(I)
    SE = strel('line',10,90);
    closed = imclose(I,SE);
   
    [B,L] = bwboundaries(closed,'noholes');
    out = label2rgb(L,@jet,[.5 .5 .5]);
end