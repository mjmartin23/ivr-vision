function [count] = goClassify(features,N,Means,Invcors,Aprioris,v)
    %Getting feature matrix 
% classifies feature struct features based on trained data
% returns matrix count where count(i,c) = 1 if features(i) is of class c
    X=features.normal_features;
    
    num = size(X,1);
    count = zeros(num,N+1);
    %Iterate through each object, classify it and add a 1 to the column of
    %classified class.
        for i= 1:num
            x=X(i,:);
            [c,~] = classify(x,N,Means,Invcors,0,Aprioris,v);
            count(i,c) = 1;
        end
    end