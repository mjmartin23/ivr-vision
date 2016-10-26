function [ Means,Invcors,Aprioris ] = train2( trainData,V )
%UNTITLED3 Summary of this function goes here
%   Detailed explanatiogin goes here

    %Takes 
    
    %Extract Mean vector, Invcors Matrix and priori probabilties from
    %features.
    disp('Building Model from training data...');
    [X,y] = reformat(trainData.table);
    uni=unique(y);
    num_labels = numel(uni);
    for i =1:size(y,1)
        n(i)=find(cellfun('length',regexp(uni,y{i})) == 1);
    end
    Means = cell(size(V,1),size(V,2));
    Invcors=cell(size(V,1),size(V,2));
    Aprioris=cell(size(V,1),size(V,2));
    for i = 1:size(V,2) 
        v=V{i};
    [Mean,Invcor,Apriori] = buildmodel(size(X(:,v),2),X(:,v),size(X(:,v),1),num_labels,n);
    Means{i} = Mean;
    Invcors{i} = Invcor;
    Aprioris{i} = Apriori;
    end
end

