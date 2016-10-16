function [ y ] = labeler( im,segs )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    num = size(segs,3);
    y = zeros(num,1);
    count =1; 
    for i = 1:num
        k=10;
        [is,js] = find(segs(:,:,i));
        subimage = im(min(is)-k:max(is)+k,min(js)-k:max(js)+k,1:3);
        if (size(subimage,1)>0)
        figure(1);imshow(subimage);
        y(i) = input('Which object is this?');
        count = count +1;
        else
        y(i) =0;
            
        end
    end

end

