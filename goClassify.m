function [count] = goClassify(features,N,Means,Invcors,Aprioris,v)
    %Getting feature matrix 
    X=features.normal_features;
    
    num = size(X,1);
    count = zeros(num,N+1);
    %Iterate through each object, classify it and add a 1 to the column of
    %classified class. Rows of count correspond to each object and the
    %columns correspond to the class it was classified as.
        for i= 1:num
            x=X(i,:);
            [c,~] = classify(x,N,Means,Invcors,0,Aprioris,v);
            count(i,c) = 1;
        end
    end