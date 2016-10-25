function [ features] = extractFeats(segs,medians )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    %Takes the original colored image and MxNxK 3D Binary Matrix with the
    %segmented objects. Returns Kx10 matrix containing feature vectors of each object. 
            num = size(segs,2);
            for i = 1: num
                %Getting indices of object from binary segment matrix segs
                segment = segs{i};
                bin_segment = median_filter(segment,medians);
               
                %Calculating RGB means
                segment = double(segment);
                for k = 1: size(segment,3)
                segment(:,:,k) = (segment(:,:,k)).*bin_segment; 
                end
%                 imshow(uint8(segment));
                grey_segment = rgb2gray(segment);
                rgb_mean = reshape(mean(mean(segment,1),2),[1,3]);
                %Calculating Compactness and Complex Moments
                complex_features =getproperties(bin_segment);
                %Calculating FAST and SURF features;
                SURF_points = detectSURFFeatures(grey_segment);
                features.SURF_features{i} = extractFeatures(grey_segment,SURF_points.selectStrongest(10));
                
                FAST_points = extractHOGFeatures(grey_segment);
                features.FAST_features{i} = FAST_points;
                                %Calculating Further Features
%                 rf=regionprops(bin_segment,'MajorAxisLength','MinorAxisLength','Extent','Solidity');
%                 try
%                 [ma1,ma2]= rf.MajorAxisLength;
%                 [mi1,mi2]=rf.MinorAxisLength;
% 
%                 catch
%                     ma1 = rf.MajorAxisLength;
%                     ma2=0;
%                     mi1=rf.MinorAxisLength;
%                     mi2=0;
%                 end
                
                features.normal_features(i,:) = [rgb_mean,complex_features];
                
            end
            
end

