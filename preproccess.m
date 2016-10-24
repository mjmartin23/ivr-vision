function [ segments ] = preproccess( images,medians,display )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
        
%Filter out background using found medians. Returns 3D matrix of images
    disp('Filtering out training images" backgrounds...')
    out = median_filter(images,medians);
    num = size(out,3);
    segments={};
    
        for i = 1:num
            fprintf('Segmenting image %d of %d\n',i,num);
            if display > 0
                figure(1);imshow(out(:,:,i));
                title('background segmented');
                input('hit enter to continue...')
            end
            %Segment and label objects
            [~,lbled]=boundary(out(:,:,i));
            %Split labelled objects. Each layer is a binary image matrix
            %containing only that object
            fprintf('Extracting objects from image %d of %d\n\n',i,num);
            segments{i}= extract(lbled);
        end


    
end

