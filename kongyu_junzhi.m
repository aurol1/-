function kongyuimg = kongyu_junzhi(img)
img = my2gray(img);
img = im2double(img);
[h,w] = size(img);
kongyuimg = zeros(h,w);
for i=2:h-1
    for j=2:w-1
            kongyuimg(i,j)=(img(i,j-1)+img(i-1,j)+img(i,j)+img(i+1,j)+img(i,j+1))/5;
    end
end
figure;
imshow(kongyuimg);
title('空域均值滤波');

