img = imread('watershed_coins_01.jpg');
img = rgb2gray(img);
subplot(211);
imshow(img);
title('Original Image');

% Plotting the magnitude of gradients
gmag = imgradient(img);
subplot(212);
imshow(gmag,[]);
title('Gradient Magnitude')

% Computing watershed transform
L = watershed(gmag);
Lrgb = label2rgb(L);
figure(2)
subplot(331);
imshow(Lrgb);
title('Watershed Transform');

% Opening
se = strel('disk',20);
Io = imopen(img,se);
subplot(332);
imshow(Io);
title('Opening');

% Closing
Ioc = imclose(Io,se);
subplot(333);
imshow(Ioc);
title('Opening-Closing');

% Calculating regional maxima
fgm = imregionalmax(Ioc);
subplot(334);
imshow(fgm);
title('Regional Maxima of Opening-Closing');

% Applying Thresholding
bw = imbinarize(Ioc);
subplot(335);
imshow(bw);
title('Thresholded Opening-Closing');

% Erosion and removing noise
se2 = strel(ones(5,5));
fgm2 = imclose(fgm,se2);
fgm3 = imerode(fgm2,se2);
fgm4 = bwareaopen(fgm3,20);
I3 = labeloverlay(img,fgm4);
subplot(336);
imshow(I3);
title('Modified Regional Maxima');

% Watershed Distance Transform
D = bwdist(bw);
DL = watershed(D);
bgm = DL == 0;
subplot(337);
imshow(bgm);
title('Watershed Ridge Lines');

% Applying watershed on modified image
gmag2 = imimposemin(gmag, bgm | fgm4);
L = watershed(gmag2);

% Visualizing the results
labels = imdilate(L==0,ones(3,3)) + 2*bgm + 3*fgm4;
I4 = labeloverlay(img,labels);
subplot(338);
imshow(I4);
title('Final Image');