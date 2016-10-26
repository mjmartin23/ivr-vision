% gets data from images on path and splits them into training, validation,
% and testing, based on the values specified in v. medians are obtained
% from initializeModel
% returns training data, validation data, and testing data
function [ trainData,valData,testData] = getData( paths,v,medians )
        
        
        [objs,classes] = pullFiles(paths);      
        %Extracts the feature vector for each object
        disp('Extracting features...')
        feats = extractFeats(objs,medians);    
        
        X=feats.normal_features;

        classes =classes';
        
        [trainInd,valInd,testInd] = dividerand(size(X,1),v(1),v(2),v(3));        
        
        trainData.table = table(X(trainInd,:),classes(trainInd),'VariableNames',{'Features','labels'});
        
        valData.table = table(X(valInd,:),classes(valInd),'VariableNames',{'Features','labels'});

        testData.table = table(X(testInd,:),classes(testInd),'VariableNames',{'Features','labels'});



end

