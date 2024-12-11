function logimg = mylog(img)
img = im2double(my2gray(img));
logimg = log(img+1);
