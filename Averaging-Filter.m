clear all;
close all;
a = imread('sp.png');
a = imresize(a, 0.25);
a = rgb2gray(a);
a = double(a);
b = a;
mask = (1/9).*[1 1 1; 1 1 1; 1 1 1];
[x, y] = size(a);
for i = 2:x-1
    for j = 2:y-1
        val = 0;
        for k = 1:3
            for l = 1:3
                val = val + mask(k,l)*a(i + k - 2, j+l-2);
            end
        end
        %keyboard();
        b(i,j) = val;
    end
end

scale = max(max(b));
b = b.*(255/scale);

a = uint8(a);
b = uint8(b);
figure(1);
subplot(2,1,1);
imshow(a);
subplot(2,1,2);
imshow(b);
