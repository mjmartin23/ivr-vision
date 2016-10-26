% takes images in directory path and creates the model based on them
% stores the segmented objects if store
% returns the medians that were obtained 
function [medians] = initializeModel( paths,store )
    disp('Initialzing...')
    %Extract image matrices and store in cell array
    images = pullFiles(paths);
    
    %train median shift on images
    disp('Calculating medians from training images...')
    medians = train_median_filter(paths);
    
    segments = preproccess(images,medians,0);
    if(store)
    disp('Storing object pictures to be labelled...');
    storeSegments(images,segments)
    end
end

