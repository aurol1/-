function threadimg = mythread(img)
img = my2gray(img);
a1 = 0;
b1 = 255;%线性变换后的范围
minGray = min(min(img));
maxGray = max(max(img));
threadimg = a1+(b1-a1)/(maxGray-minGray)*(img-minGray);
