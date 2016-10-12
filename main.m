% file for running main script

I = imread('simpler/02.jpg');

% will need to find a way to programatically determine this
numObjects = 12;

[out,centres,groups] = mean_shift(I,5,25,1000);

disp('mean shifted');

layers = extract(out,numObjects);

disp('layers extracted');

for i = 1:numObjects
    %figure(i),imshow(layers(:,:,i));
end