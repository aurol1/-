function posongimg = posong(img)
posongimg=imnoise(img,'poisson');
%泊松