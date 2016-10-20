function [ y ] = labeler( im,segs )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    num = size(segs,3);
    y = zeros(num,1);
    for i = 1:num
        k=10;
        [is,js] = find(segs(:,:,i));
        subimage = im(max((min(is)-k),1): min((max(is)+k),size(im,1)),max((min(js)-k),1):min((max(js)+k),size(im,2)),1:3);
        if (size(subimage,1)<0)
        figure(1);imshow(subimage);
        y(i) = input('Which object is this? ');
        else
        y(i) =6;
            
        end
    end

end

