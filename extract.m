function [ segments ] = extract( im )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
        [is,js] = find(im>-1);
        classified = im;
        nums = max(max(classified));
        segments= zeros(size(im,1),size(im,2),nums);
        count =1;
        for i = 1:nums
            newIm = zeros(size(im));
            [inds,jnds] = find(classified == i);
            indexs = sub2ind(size(classified),inds,jnds);
            a = [is,js];
            tmp = a(indexs,:);
            indexs = sub2ind(size(classified),tmp(:,1),tmp(:,2));
            newIm(indexs) = 1;
            segments(:,:,count) = newIm;
            count = count +1;
        end

end

