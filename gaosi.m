function gaosi_img = gaosi(img,a,b)
[h,w,r]=size(img);
y=a+b*randn(h,w);
gaosi_img=double(img)/255;
gaosi_img=gaosi_img+y;
gaosi_img=gaosi_img*255;
gaosi_img = uint8(gaosi_img);
%高斯