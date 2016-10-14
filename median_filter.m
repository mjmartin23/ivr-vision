% read in all images
function out = median_filter(I,paths)
    files = [];
    for k = 1:length(paths)
        path = paths{k};
        files = cat(1,files,dir(strcat(path,'*.jpg')));
    end
    [numFiles,~]=size(files);
    
    oneFileToGetSize = files(1);
    oneFileToGetSize = imread(strcat(oneFileToGetSize.folder,'/',oneFileToGetSize.name));
    [rows,cols,colors]=size(oneFileToGetSize);
    
    pixelsOverTime = zeros(rows,cols,colors,numFiles);
    index = 1;
    for file = files'
        J = imread(strcat(file.folder,'/',file.name));
        for i = 1:rows
            for j = 1:cols
                pixelsOverTime(i,j,:,index) = J(i,j,:);
            end
        end
        index = index + 1;
    end
    
    medians = zeros(rows,cols,colors);
    for i = 1:rows
        for j = 1:cols
            for k = 1:colors
                medians(i,j,k) = median(pixelsOverTime(i,j,k,:));
            end
        end
    end

    I=double(I);
    out = zeros(rows,cols);
    for i = 1:rows
        for j = 1:cols
            diff = sum(abs(medians(i,j,:)-I(i,j,:)));
            if (diff < 50)
                out(i,j) = 0;
            else
                out(i,j) = 1;
            end
        end
    end
    
    out = bwareaopen(out,20);
end