% read in all images
files1 = dir('simpler/*.jpg');
files2 = dir('harder/*.jpg');
files = cat(1,files1,files2);
[numFiles,~]=size(files);
oneFileToGetSize = imread(strcat('simpler/',files1(1).name));
[rows,cols,colors]=size(oneFileToGetSize);
pixelsOverTime = zeros(rows,cols,colors,numFiles);
index = 1;
for file = files'
    I = imread(strcat(file.folder,'/',file.name));
    for i = 1:rows
        for j = 1:cols
            pixelsOverTime(i,j,:,index) = I(i,j,:);
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

I=double(imread('simpler/07.jpg'));
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
figure(),imshow(out);