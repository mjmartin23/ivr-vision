function [ clusters ] = clusterFeatures( surf,fast,labels )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
        uni=unique(labels);
        y = zeros(size(labels));
    for i =1:size(labels)
        y(i)=find(cellfun('length',regexp(uni,labels{i})) == 1);
    end
        size(uni,1)
        for i = 1 : size(uni,1)
            is = y==i;
            clusters.surf{i} =[];
            clusters.fast{i} =[];
            for j = is
                clusters.surf{i} = cat(1,clusters.surf{i},surf{j});
                clusters.fast{i} = cat(1,clusters.fast{i},fast{j});
            end
             clusters.surf{i} = mean( clusters.surf{i},3); 
        end
end

