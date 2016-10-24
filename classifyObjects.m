function [ confMatrix,prec,recall,f1_score ] = classifyObjects( X,fsfeats,clusters,y,classnames,N,Means,Invcors,Dim,Aprioris,v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    num = size(X,1);
    t=zeros(N);
    
        for i = 1:num
            x = X(i,:);
            feats.surf = fsfeats.surf(i);
            feats.fast = fsfeats.fast(i);
            [c,~] = classify(x,N,Means,Invcors,Dim,Aprioris,feats,clusters,v);
            t(y(i),c) = t(y(i),c)+1;
        end
        for i = 1:N
        prec(i)=t(i,i)/sum(t(:,i));
        recall(i)=t(i,i)/sum(t(i,:));
        end
        f1_score = 2*prec.*recall./(prec + recall);
        f1_score(isnan(f1_score))=0;
        confMatrix= array2table(t,'VariableNames',classnames,'RowNames',classnames');
        
end

