function indeximg = myindex(img)
img = double(my2gray(img));
indeximg = uint8(1.5.^(img*0.070)-1);
figure;
imshow(indeximg);
title('指数增强');