function [ confMatrix,prec,recall,f1_score ] = classifyObjects( X,fsfeats,clusters,y,classnames,N,Means,Invcors,Dim,Aprioris )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    num = size(X,1);
    t=zeros(N);
    
    topClasses = cell(1,num);
        for i = 1:num
            x = X(i,:);
            feats.surf = fsfeats.surf(i);
            feats.fast = fsfeats.fast(i);
            [c,top3] = classify(x,N,Means,Invcors,Dim,Aprioris,feats,clusters);
            t(y(i),c) = t(y(i),c)+1;
 
            %names = classnames(top3(:,2)');
            %topClasses{i} = table(y(i)*ones(3,1),names',top3(:,1),'VariableNames',{'label','Top_Three_Classes','Probability'});
        end
        for i = 1:N
        prec(i)=t(i,i)/sum(t(:,i));
        recall(i)=t(i,i)/sum(t(i,:));
        end
        f1_score = 2*prec.*recall./(prec + recall);
        confMatrix= array2table(t,'VariableNames',classnames,'RowNames',classnames');
        
end

