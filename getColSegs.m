% finds and returns the RGB subimages of im where each subimage is one
% object in im
function [ subimages ] = getColSegs(  im,segs  )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    num = size(segs,3);
    count = 1;
    for i = 1:num
        k=5;
        [is,js] = find(segs(:,:,i));
        subimage = im(max((min(is)-k),1): min((max(is)+k),size(im,1)),max((min(js)-k),1):min((max(js)+k),size(im,2)),1:3);
        if (size(subimage,1)*size(subimage,2)>2000)
            subimages{count}=subimage;
            count = count +1;
        end
    end




end

