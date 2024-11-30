function posongimg = posong(img)
posongimg=imnoise(img,'poisson');
figure;
imshow(posongimg);
title('泊松噪声');