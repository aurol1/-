function logimg = mylog(img)
img = im2double(my2gray(img));
logimg = log(img+1);
figure;
imshow(logimg);
title('对数增强');