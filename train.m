function [ Means,Invcors,Aprioris ] = train( trainData,num_labels,v )
%UNTITLED3 Summary of this function goes here
%   Detailed explanatiogin goes here

    %Takes 
    
    %Extract Mean vector, Invcors Matrix and priori probabilties from
    %features.
    disp('Building Model from training data...');
    [X,y] = reformat(trainData);
    
    [Means,Invcors,Aprioris] = buildmodel(size(X(:,v),2),X(:,v),size(X(:,v),1),num_labels,y);

end

