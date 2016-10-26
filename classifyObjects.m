function [ confMatrix,prec,recall,f1_score ,top3s] = classifyObjects( X,y,classnames,N,Means,Invcors,Dim,Aprioris,v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    num = size(X,1);
    t=zeros(N+1);
    
        for i = 1:num
            x = X(i,:);
            feats.surf = fsfeats.surf(i);
            feats.fast = fsfeats.fast(i);
            [c,top3] = classify(x,N,Means,Invcors,Dim,Aprioris,feats,,v);
            top3s{i} = top3;
            t(y(i),c) = t(y(i),c)+1;
        end
        for i = 1:N
        prec(i)=t(i,i)/sum(t(:,i));
        recall(i)=t(i,i)/sum(t(i,:));
        end
        f1_score = 2*prec.*recall./(prec + recall);
        classnames{end+1} = 'NotSure';
        f1_score(isnan(f1_score))=0;
        confMatrix= array2table(t,'VariableNames',classnames,'RowNames',classnames');
        
end

