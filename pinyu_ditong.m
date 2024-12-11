function pinyuimg = pinyu_ditong(img)
img = my2gray(img);
img = im2double(img);
[h,w] = size(img);
M=2*h;N=2*w;
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);%meshgrid(u,v)的作用是分别产生以向量u为行，向量v为裂的两个大小相同的矩阵
D=sqrt(U.^2+V.^2);%设置频率点（U,V）与频域中心的距离为D（U,V）
D0=40;             %截止频率
H=double(D<=D0);    %理想低通滤波器
J=fftshift(fft2(img,size(H,1),size(H,2)));%通过傅里叶变换将时域图像转换到频域图像，并移动到中心位置
K=J.*H;                         %滤波处理
pinyuimg=ifft2(ifftshift(K));          %傅里叶反转换
pinyuimg=pinyuimg(1:h,1:w);                   %设置图像的大小
%频域低通