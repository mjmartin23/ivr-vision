function [ Means,Invcors,Aprioris ] = train( paths )
%UNTITLED3 Summary of this function goes here
%   Detailed explanatiogin goes here

    %Takes 
    disp('Initialzing...')
    num_labels = 6;
    segments = [];
    %Extract image matrices and store in cell array
    images = pullFiles(paths);
    
    %train median shift on images
    disp('Calculating medians from training images...')
    medians = train_median_filter(paths);
    
    
    %Filter out background using found medians. Returns 3D matrix of images
    disp('Filtering out training images" backgrounds...')
    out = median_filter(images,medians);
    num = size(out,3);
    y=[];
    X=[];
    for i = 1:num
        fprintf('Segmenting image %d of %d\n',i,num);
        %Segment and label objects
        [~,lbled]=boundary(out(:,:,i));
        %Split labelled objects. Each layer is a binary image matrix
        %containing only that object
        fprintf('Extracting image %d of %d\n\n',i,num);
        segments= extract(lbled);
        
        %Function iterates through the layers of segments, shows user the
        %image and waits for user to input label into the console
        disp('Initialzing labeler...');
        y = [y;labeler(images{i},segments)];
        
        %Extracts the feature vector for each object
        disp('Extracting features...')
        X=[X;extractFeatures(images{i},segments)];
    
    end

    
    
    %Extract Mean vector, Invcors Matrix and priori probabilties from
    %features.
    disp('Building Model...');
    [Means,Invcors,Aprioris] = buildmodel(size(X,2),X,size(X,1),num_labels,y);

end

