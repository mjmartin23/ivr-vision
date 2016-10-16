function [ features ] = extractFeatures( im,segs )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    %Takes the original colored image and MxNxK 3D Binary Matrix with the
    %segmented objects. Returns Kx10 matrix containing feature vectors of each object. 
            num = size(segs,3);
            features = zeros(num,10);
            for i = 1: num
                %Getting indices of object from binary segment matrix segs
                segment = segs(:,:,i);
                [is,js] = find(segment);
                %Calculating RGB means
                rgb_mean = reshape(mean(mean(im(is,js,1:3),1),2),[1,3]);
                %Calculating Compactness and Complex Moments
                v =getproperties(segment);
                features(i,:) = [rgb_mean,v];
            end
end

