% read in all images
function out = median_filter(I,paths)
    
    files = {};
    for k = 1:length(paths)
        path = paths{k};
        [~,attr] = fileattrib(strcat(path,'*.jpg'));
        for file = attr
            name = file.Name;
            files{end + 1} = name;
        end
    end
    [numFiles,~]=size(files);
    
    oneFileToGetSize = files{1};
    oneFileToGetSize = imread(oneFileToGetSize);
    [rows,cols,colors]=size(oneFileToGetSize);
    
    pixelsOverTime = zeros(rows,cols,colors,numFiles);
    index = 1;
    for k = 1:length(files)
        file = files{k};
        J = imread(file);
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