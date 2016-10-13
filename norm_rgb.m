function [out] = norm_rgb(I)
    figure(1),imshow(I);
    red = double(I(:,:,1));
    green = double(I(:,:,2));
    blue = double(I(:,:,3));
    denom = red + green + blue;
    dub = double(I);
    normed = uint8(255.*(dub./denom));
    
    %imtool(normed);
    
    [rows,cols,~] = size(normed);
    rmid=median(reshape(normed(:,:,1),[1,rows*cols]));
    gmid=median(reshape(normed(:,:,2),[1,rows*cols]));
    bmid=median(reshape(normed(:,:,3),[1,rows*cols]));
    
    out = zeros(rows,cols);
    for i = 1:rows
        for j = 1:cols
             if ((normed(i,j,1) < rmid+10) && ... 
                 (normed(i,j,2) < gmid+5) && ...
                 (normed(i,j,3) < bmid+5))
%            if (abs(normed(i,j,1) - normed(i,j,2)) + abs(normed(i,j,1) - normed(i,j,3)) + ...
%                    abs(normed(i,j,2) - normed(i,j,3)) < 20)
                out(i,j) = 0;
            else
                out(i,j) = 1;
            end
        end
    end
    
    figure(),imshow(out);
                
end