function [ copy ] = separate( segments,index )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
            temp = extract(segments(:,:,index),2);
            copy = segments(:,:,[1:index-1,min(index+1,size(segments,3)):end]);
            copy(:,:,size(segments,3)) = temp(:,:,1);
            copy(:,:,size(segments,3)+1) = temp(:,:,2);

end

