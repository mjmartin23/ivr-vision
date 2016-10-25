% top-level function for when we are in the practical

function labeled = go(pathsToImages,display)
    % pathToImages : cell array of 1 or more paths to the images to be used
    % display      : if 1 will display labeled images as they are processed
    % labeled      : array of all images from pathsToImages, with visual
    %                labels for each object in the image superimposed
    
    [Means,Invcors,Aprioris,clusters] = train();

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
        
        count = goClassify(features,10,Means,Invcors,Aprioris,clusters,{[1:3],[4,5]});
                
        fprintf('got features for image %d\n',index);
        
    end
    
end