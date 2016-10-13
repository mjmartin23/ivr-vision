% file for running main script

I = imread('simpler/05.jpg');

% will need to find a way to programatically determine this
numObjects = 12;

I = norm_rgb(I);

[out,centres,groups] = mean_shift(I,5,25,1000);

figure(),imshow(out);

disp('mean shifted');

layers = extract(out,numObjects);

disp('layers extracted');

for i = 1:numObjects
    %figure(i),imshow(layers(:,:,i));
end