function [count] = goClassify(features,N,Means,Invcors,Aprioris,clusters,v)
    X=features.normal_features;
    num = size(X,1);
    count = zeros(num,N+1);
        for i= 1:num
            x=X(i,:);
            feats.surf = features.SURF_features(i);
            feats.fast = features.FAST_features(i);
            [c,~] = classify(x,N,Means,Invcors,0,Aprioris,feats,clusters,v);
            count(i,c) = 1;
        end
    end