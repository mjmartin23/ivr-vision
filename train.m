function [ Means,Invcors,Aprioris,clusters,uni ] = train()
%UNTITLED3 Summary of this function goes here
%   Detailed explanatiogin goes here

    %Takes 
    
    %Extract Mean vector, Invcors Matrix and priori probabilties from
    %features.
    impaths = {'medianTrain/'};
    segpaths = {'training/AAA/','training/onepound/','training/twopound/','training/fivepence/','training/twentypence/','training/fiftypence/','training/washersmlhole/','training/washerlghole/','training/nut/','training/anglebracket/'};
    m = initializeModel(impaths);
    [trainData,~,~] = getData(segpaths,[1,0,0],m);
    clusters = trainData.clusters;
    disp('Building Model from training data...');
    [X,y] = reformat(trainData.table);
    uni=unique(y);
    num_labels = numel(uni);
    for i =1:size(y,1)
        n(i)=find(cellfun('length',regexp(uni,y{i})) == 1);
    end
    V={[1:3],[4,5]};
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

