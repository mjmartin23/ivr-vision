function [ trainData,valData,testData] = getData( paths,v,medians )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
        
        
        [objs,classes] = pullFiles(paths);      
        %Extracts the feature vector for each object
        disp('Extracting features...')
        feats = extractFeats(objs,medians);    
        
        X=feats.normal_features;
        surf = feats.SURF_features;
        fast = feats.FAST_features;
        
        classes =classes';
        
        [trainInd,valInd,testInd] = dividerand(size(X,1),v(1),v(2),v(3));
        
        trainedClusters=clusterFeatures(surf(trainInd),fast(trainInd),classes(trainInd));
        
        
        trainData.table = table(X(trainInd,:),classes(trainInd),'VariableNames',{'Features','labels'});
        trainData.clusters = trainedClusters;
        
        valData.table = table(X(valInd,:),classes(valInd),'VariableNames',{'Features','labels'});
        valData.feats.surf = surf(valInd);
        valData.feats.fast = fast(valInd);

        testData.table = table(X(testInd,:),classes(testInd),'VariableNames',{'Features','labels'});
        testData.feats.surf = surf(testInd);
        testData.feats.fast = fast(testInd);
        


end

