function [ Means,Invcors,Aprioris ] = train( trainData,v )
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
    [Means,Invcors,Aprioris] = buildmodel(size(X(:,v),2),X(:,v),size(X(:,v),1),num_labels,n);

end

