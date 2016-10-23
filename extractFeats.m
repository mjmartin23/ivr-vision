function [ features] = extractFeats(segs,medians )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    %Takes the original colored image and MxNxK 3D Binary Matrix with the
    %segmented objects. Returns Kx10 matrix containing feature vectors of each object. 
            num = size(segs,2);
            SURF_features = cell(num,1);
            FAST_features = cell(num,1);
            for i = 1: num
                %Getting indices of object from binary segment matrix segs
                segment = segs{i};
                bin_segment = median_filter(segment,medians);
                grey_segment = rgb2gray(segment);
                %Calculating RGB means
                rgb_mean = reshape(mean(mean(segment,1),2),[1,3]);
                %Calculating Compactness and Complex Moments
                complex_features =getproperties(bin_segment);
                %Calculating FAST and SURF features;
                SURF_points = detectSURFFeatures(grey_segment);
                features.SURF_features{i} = extractFeatures(grey_segment,SURF_points.selectStrongest(10));
                
                FAST_points = detectSURFFeatures(grey_segment);
                features.FAST_features{i} = extractFeatures(grey_segment,FAST_points.selectStrongest(10));
                                %Calculating Further Features
                rf=regionprops(bin_segment,'MajorAxisLength','MinorAxisLength','Extent','Solidity');
                try
                [ma1,ma2]= rf.MajorAxisLength;
                [mi1,mi2]=rf.MinorAxisLength;

                catch
                    ma1 = rf.MajorAxisLength;
                    ma2=0;
                    mi1=rf.MinorAxisLength;
                    mi2=0;
                end
                
                rf.Extent;
                rf.Solidity;
                features.normal_features(i,:) = [rgb_mean,[ma1,ma2],[mi1,mi2],complex_features];
                
            end
            
end

