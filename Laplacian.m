clear all;
close all;
a = imread('unnamed.png');
a = imresize(a, 1);
a = rgb2gray(a);
a = double(a);

padd = input("Padding? 1/0");
[x, y] = size(a);
disp("x = "); disp(x);
disp("y = "); disp(y);

if (padd == 1)
    %add Code
    z = zeros(x,1);
    a = [z a z];
    [x, y] = size(a);
    z = zeros(1,y);
    a = [z; a; z];
    [x, y] = size(a);
end
b = a;
disp("x = "); disp(x);
disp("y = "); disp(y);
mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];


for i = 2:x-1
    for j = 2:y-1
        val = 0;
        for k = 1:3
            for l = 1:3
                val = val + mask(k,l)*a(i + k - 2, j+l-2);
            end
        end
        %keyboard();
        b(i,j) = val/9;
    end
end

scale = max(b, [], 'all');
b = b.*(255/scale);

a = uint8(a);
b = uint8(b);
figure(1);
subplot(211);
imshow(a);
subplot(212);
imshow(b);
