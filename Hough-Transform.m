I = imread('sp.png');
close all;

BW = edge(I,'canny');
[H,theta,rho] = hough(BW);
figure
imshow(imadjust(rescale(H)),[],'XData',theta,'YData',rho, 'InitialMagnification','fit');
xlabel('\theta (degrees)');
ylabel('\rho');
axis on
axis normal 
hold on
colormap(gca,hot)
P = houghpeaks(H,4);
x = theta(P(:,2));
y = rho(P(:,1));
plot(x,y,'s','color','blue');
lines = houghlines(BW,theta,rho,P);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');
   plot(xy(1,1),xy(1,2),'x','LineWidth',1,'Color','red');
   plot(xy(2,1),xy(2,2),'x','LineWidth',1,'Color','red');
end