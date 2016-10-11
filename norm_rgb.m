function [out] = norm_rgb(I)
    red = double(I(:,:,1));
    green = double(I(:,:,2));
    blue = double(I(:,:,3));
    denom = red + green + blue;
    dub = double(I);
    out = uint8(255.*(dub./denom));
end
    