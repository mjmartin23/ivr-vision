function [ segments ] = extract( im,num )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
        [is,js] = find(im);
        classified = kmeans([is,js],num);
        segments= zeros(size(im,1),size(im,2),num);
        for i = 1:num
            newIm = zeros(size(im));
            [inds,jnds] = find(classified == i);
            indexs = sub2ind(size(classified),inds,jnds);
            a = [is,js];
            tmp = a(indexs,:);
            indexs = sub2ind(size(im),tmp(:,1),tmp(:,2));
            newIm(indexs) = 1;
            segments(:,:,i) = newIm;
        end

end

