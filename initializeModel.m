function [medians] = initializeModel( paths )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    disp('Initialzing...')
    %Extract image matrices and store in cell array
    images = pullFiles(paths);
    
    %train median shift on images
    disp('Calculating medians from training images...')
    medians = train_median_filter(paths);
    
    segments = preproccess(images,medians,0);
    
    disp('Storing object pictures to be labelled...');
    storeSegments(images,segments)
    
end

