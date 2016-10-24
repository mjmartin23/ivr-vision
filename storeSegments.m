function [  ] = storeSegments( ims,segments )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    for c =1:size(ims,2)
        im = ims{c};
        segs = segments{c};
        num = size(segs,3);

    for i = 1:num
        k=5;
        [is,js] = find(segs(:,:,i));
        subimage = im(max((min(is)-k),1): min((max(is)+k),size(im,1)),max((min(js)-k),1):min((max(js)+k),size(im,2)),1:3);
        if (size(subimage,1)>0)
            imwrite(subimage,(sprintf('unlabelledObjects/img_%d_object_%d.jpg',c,i)));
 
        figure(1);imshow(subimage);
        end
    end
    end

end

