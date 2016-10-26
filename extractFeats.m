function [ features, empties] = extractFeats(segs,medians )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    %Extracts the features from the object in each subimage and stores the object's
    %feature vector in a matrix. Each row coresponding to an object and
    %each column to a feature.
            
            %Number of objects
            num = size(segs,2);
            
            %Initializing the 
            em=0;
            %empties stores the indices of the subimages that have no
            %objects in them
            empties =[];
            
            %Iterating through each object
            for i = 1: num
                
                segment = segs{i};
                
                %Getting binary image of object to calculate the compactness and complex moments.
                bin_segment = median_filter(segment,medians); 
 
                %Checking whether the subimage has an object in it, else
                %remove it and skip feature extraction.
                if(numel(find(bin_segment))<20)
                    
                    segs(i)=[];
                    empties(end+1) = (i+em);
                    %keeping track of how many were deleted to calculate
                    %proper index.
                    em=em+1;
                    i=i-1;
                    continue
                end
                %Calculating RGB means
                segment = double(segment);
                for k = 1: size(segment,3)
                segment(:,:,k) = (segment(:,:,k)).*bin_segment; 
                end
                rgb_mean = reshape(mean(mean(segment,1),2),[1,3]);
                
                %Calculating Compactness and Complex Moments
                complex_features =getproperties(bin_segment);
                
                %Storing features in a matrix in a structure.
                features.normal_features(i,:) = [rgb_mean,complex_features];
                
            end
            
end

