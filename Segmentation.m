img = imread('Fig0334(a)(hubble-original).tif');

imgCopy = img;
blurredImage = imfilter(img, ones(15)/225, 'symmetric');
img = blurredImage;
thresh1 = (img > 61);
thresh2 = (img < 256);
thresh3 = (thresh1 & thresh2);
blurredImage = imfilter(img, ones(15)/225, 'symmetric');

[r,c] = size(img);

for i = 1:r
    for j = 1:c
        if(thresh3(i,j)) 
            img(i,j) = 255;
        else
            img(i,j) = 0;
        end
    end
end

figure(1);
subplot(1,2,2);
imshow(img);
subplot(1,2,1);
imshow(imgCopy);