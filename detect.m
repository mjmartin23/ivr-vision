obj=rgb2gray(imread('simpler/lbracket.jpg'));
scene=rgb2gray(imread('simpler/02.jpg'));
objPoints = detectSURFFeatures(obj);
scenePoints = detectSURFFeatures(scene);

figure;
imshow(obj);
title('100 Strongest Feature Points from obj Image');
hold on;
plot(selectStrongest(objPoints, 100));

figure;
imshow(scene);
title('300 Strongest Feature Points from Scene Image');
hold on;
plot(selectStrongest(scenePoints, 300));

[objFeatures, objPoints] = extractFeatures(obj, objPoints);
[sceneFeatures, scenePoints] = extractFeatures(scene, scenePoints);

objPairs = matchFeatures(objFeatures, sceneFeatures);

matchedObjPoints = objPoints(objPairs(:, 1), :);
matchedScenePoints = scenePoints(objPairs(:, 2), :);
figure;
showMatchedFeatures(obj, scene, matchedObjPoints, ...
    matchedScenePoints, 'montage');
title('Putatively Matched Points (Including Outliers)');