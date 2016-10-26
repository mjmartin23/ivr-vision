function [ confTable,prec,rec,f1,tp ] = validate( valData,means,invc,priori,v )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    

        

        [X,y] = reformat(valData.table);
        uni=unique(y);
        classNames = uni;
    for i =1:size(y,1)
        n(i)=find(cellfun('length',regexp(uni,y{i})) == 1);
    end
        [confTable,prec,rec,f1,tp]=classifyObjects(X,n,classNames,size(classNames,1),means,invc,size(X,2),priori,v);

end

