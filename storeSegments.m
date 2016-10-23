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
            
%             [h,vs]=extractHOGFeatures(I, 'CellSize',[2 2]);
%             
%             corners1 = detectFASTFeatures(I,'MinContrast',0.1);
%             corners2 = detectSURFFeatures(I);
%             gr = rgb2gray(subimage);
%             grey1 = detectFASTFeatures(gr,'MinContrast',0.1);
%             grey2 = detectSURFFeatures(gr);
%             
%             J1 = insertMarker(I,corners1.selectStrongest(10),'circle');
%             J2 = insertMarker(I,corners2.selectStrongest(10).Location,'circle');
% 
%             G1 = insertMarker(gr,grey1.selectStrongest(10),'circle');
%             G2 = insertMarker(gr,grey2.selectStrongest(10).Location,'circle');
% 
%             figure();
%             subplot(2,1,1)
%             imshow(J1);
%             title('FAST Features')
%             
%             
%             subplot(2,2,1)
%             imshow(G1);
%             title('FAST Features Grey')
%             
%             subplot(2,1,2)
%             imshow(J2);
%             title('SURF Features')
%             
%             
%             subplot(2,2,2)
%             imshow(G2);
%             title('SURF Features Grey')
            
%             subplot(2,1,3)
%             vs.plot
%             title('HOG Features')
        figure(1);imshow(subimage);
        end
    end
    end

end

