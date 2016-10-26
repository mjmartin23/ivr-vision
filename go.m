% top-level function for when we are in the practical

function [] = go(pathsToImages,display)
    % pathToImages : cell array of 1 or more paths to the images to be used
    % display      : if 1 will display labeled images as they are processed
    
    [Means,Invcors,Aprioris,classNames] = train();

    % retrieve image from pathToImages
    [images,~] = pullFiles(pathsToImages);
    
    % generate medians for median filter
    medians = train_median_filter(pathsToImages);
    
    % get binary segments for each object in each image
    allSegments = preproccess(images,medians,display);
    
    size(allSegments)
        
    % for each image I in segments, classify the objects in it
    for index = 1 : length(allSegments)
        
        segments = allSegments{index};

        
        I = images{index};
        subImages = getColSegs(I,segments);
        
        % extract features for image I
        [features,empties] = extractFeats(subImages,medians);
        fprintf('\ngot features for image %d\n',index);
        
        subImages(empties) = [];
 
        % classify objects in I
        count = goClassify(features,10,Means,Invcors,Aprioris,clusters,{[1:3],[4,5]});
        fprintf('classified objects in image %d\n',index);
        

        % for subimage i, row i of count says which class it is
        if display > 0
            figure(3);
        end
        num = size(subImages,2);
        sizesp = ceil(sqrt(num));
        classNames{end+1}='NotSure';
        if display > 0
            for i = 1:num
               class = ['class: ',classNames{find(count(i,:))}];
               subplot(sizesp,sizesp,i),subimage(subImages{i});
               title(class);
            end
        end
        
        moneyVec = [0,2,50,5,0,100,20,200,25,75,0];
        totalMoneyPence = sum(count,1)*moneyVec';

        %subplot(sizesp,sizesp+1,sizesp*(sizesp+1)),subimage(I);
        moneyString = strcat('Total money in image ',num2str(index),': £ ', num2str(totalMoneyPence/100.0));
        if display > 0
            annotation('textbox', [0 0.9 1 0.1], ...
                'String', moneyString, ...
                'EdgeColor', 'none', ...
                'HorizontalAlignment', 'center', ...
                'Tag','deleteThis')
            disp('hit enter to continue...');
            pause();
            delete(findall(gcf,'Tag','deleteThis'));
        end
        
        disp(moneyString);
        
    end
    
end