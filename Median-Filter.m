clear all;
close all;
a = imread('sp.png');
a = imresize(a, 0.25);
a = rgb2gray(a);
b = a;
mask = [1 1 1; 1 1 1; 1 1 1];
[x, y] = size(a);
for i = 2:x-1
    for j = 2:y-1
        mat = [];
        for k = 1:3
            for l = 1:3
                mat = [mat a(i + k - 2, j+l-2)];
            end
        end
        %keyboard();
        b(i,j) = median(mat);
    end
end
figure(1);
subplot(121);
imshow(a);
subplot(122);
imshow(b);