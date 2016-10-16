function [ medians ] = train_median_filter( paths )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
   
    files = pullFiles(paths);
    
    [numFiles,~]=size(files);
    
    oneFileToGetSize = files{1};
    [rows,cols,colors]=size(oneFileToGetSize);
    
    pixelsOverTime = zeros(rows,cols,colors,numFiles);
    index = 1;
    for k = 1:length(files)
        file = files{k};
        J = file;
        pixelsOverTime(:,:,:,index) = J(:,:,:);
        index = index + 1;
    end
    
    medians = zeros(rows,cols,colors);
    medians = median(pixelsOverTime,4);
 
end

