% top-level function for when we are in the practical

function labeled = go(pathsToImages,display)
    % pathToImages : cell array of 1 or more paths to the images to be used
    % display      : if 1 will display labeled images as they are processed
    % labeled      : array of all images from pathsToImages, with visual
    %                labels for each object in the image superimposed

    % retrieve image from pathToImages
    [images,~] = pullFiles(pathsToImages);
    
    % generate medians for median filter
    medians = train_median_filter(pathsToImages);
    
    % get binary segments for each object in each image
    allSegments = preproccess(images,medians,display);
        
    % for each image I in segments, classify the objects in it
    for index = 1 : length(allSegments)
        
        segments = allSegments{index};
        I = images{index};
        subImages = getColSegs(I,segments);
        
        % extract features for image I
        features = extractFeats(subImages,medians);
        
        X=features.normal_features;
        surf = features.SURF_features;
        fast = features.FAST_features;
        
    end
    
end