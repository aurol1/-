function mubiaoimg = mubiao(img,bg)
[row,col,~] = size(bg);
img = imresize(img,[row,col]);
mubiaoimg = imsubtract(img,bg);
mubiaoimg(mubiaoimg<0) = 0;
figure;
imshow(mubiaoimg);
title('目标提取');