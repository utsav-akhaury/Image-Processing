i = imread('cameraman.tif');
i2 = rgb2gray(i);

imshow(i2);
imageinfo;

MSB = zeros(400,400);
seven = zeros(400,400);
six = zeros(400,400);
five = zeros(400,400);
four = zeros(400,400);
three = zeros(400,400);
two = zeros(400,400);
LSB = zeros(400,400);

for i = 1:400
    for j = 1:400        
        MSB(i,j) = bitand(i2(i,j), bin2dec('10000000')); 
        seven(i,j) = bitand(i2(i,j), bin2dec('01000000'));
        six(i,j) = bitand(i2(i,j), bin2dec('00100000'));
        five(i,j) = bitand(i2(i,j), bin2dec('00010000'));
        four(i,j) = bitand(i2(i,j), bin2dec('00001000'));
        three(i,j) = bitand(i2(i,j), bin2dec('00000100'));
        two(i,j) = bitand(i2(i,j), bin2dec('10000010'));
        LSB(i,j) = bitand(i2(i,j), bin2dec('00000001'));
    end
end

figure,imshow(MSB);
figure,imshow(seven);
figure,imshow(six);
figure,imshow(five);
figure,imshow(four);
figure,imshow(three);
figure,imshow(two);
figure,imshow(LSB);
