clear,clc,close all;
I2 = imread("3.jpg");
figure;
imshow(I2);
title('原图');
robert = lapulasi(I2);
