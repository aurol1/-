function kongyuimg = kongyu_zhongzhi(img)
img = my2gray(img);
img = im2double(img);
[h,w] = size(img);
kongyuimg = zeros(h,w);
for i=2:h-1
    for j=2:w-1
        neighbor=img(i-1:i+1,j-1:j+1);  %截取邻域
        kongyuimg(i,j)=median(neighbor(:));   %中值滤波
    end
end
figure;
imshow(kongyuimg);
title('空域中值滤波');