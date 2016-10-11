function [ copy ] = merge( segments, i, j )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
            m1 = segments(:,:,i);
            m2 = segments(:,:,j);
            temp = m1 +m2;
            copy = segments;
            copy(:,:,i) = temp;
            copy = copy(:,:,[1:j-1,min((j+1),size(segments,3)):end]);
            
            
            
end

