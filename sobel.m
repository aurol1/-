function sobelimg = sobel(img)
img = my2gray(img);
[h,w] = size(img);
sobelNum=0;
sobelThreshold=0.7;
for j=2:h-1
    for k=2:w-1
        sobelNum=abs(img(j-1,k+1)+2*img(j,k+1)+img(j+1,k+1)-img(j-1,k-1)-2*img(j,k-1)-img(j+1,k-1))+abs(img(j-1,k-1)+2*img(j-1,k)+img(j-1,k+1)-img(j+1,k-1)-2*img(j+1,k)-img(j+1,k+1));
        if(sobelNum > sobelThreshold)
            sobelimg(j,k)=255;
        else
            sobelimg(j,k)=0;
        end
    end
end
%sobel