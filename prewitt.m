function prewittimg = prewitt(img)
img = my2gray(img);
[h,w] = size(img);
PrewittNum=0;
PrewittThreshold=0.5;%设定阈值
for j=2:h-1 %进行边界提取
    for k=2:w-1
        PrewittNum=abs(img(j-1,k+1)-img(j+1,k+1)+img(j-1,k)-img(j+1,k)+img(j-1,k-1)-img(j+1,k-1))+abs(img(j-1,k+1)+img(j,k+1)+img(j+1,k+1)-img(j-1,k-1)-img(j,k-1)-img(j+1,k-1));
        if(PrewittNum > PrewittThreshold)
            prewittimg(j,k)=255;
        else
            prewittimg(j,k)=0;
        end
    end
end
figure;
imshow(prewittimg);
title('prewitt');