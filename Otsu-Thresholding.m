im = imread('cameraman.tif');
[counts,binLocations] = imhist(im);
N = sum(counts);
n = counts/N;
omega = zeros(numel(counts),1);
u = zeros(numel(counts),1);

for i=1:numel(counts)
    for j=1:i
        omega(i)= omega(i)+n(j);
        u(i)= u(i)+ j*n(j);
    end
end

u_T = u(numel(counts));
one_m = ones(numel(counts),1);
sigma_sq = (u_T*omega - u).*(u_T*omega - u)./(omega.*(one_m-omega));
thresh=1;

for k=1:numel(counts)-1
   if  sigma_sq(k+1)>sigma_sq(k)
       thresh = k+1;
   else thresh=thresh;
   end
end

[rows,cols]= size(im); 
im_otsu = zeros(rows,cols);

for i= 1:rows
    for j= 1:cols
        if im(i,j) > thresh
            im_otsu(i,j)=255;
        else im_otsu(i,j)=0;  
        end  
    end
end

figure(1)
image(im)
colormap(gray(256))
title('Original');

figure(2)
image(im_otsu)
colormap(gray(256))
title('Otsu thresholding');
