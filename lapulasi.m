function lapulasiimg = lapulasi(img)
img = my2gray(img);
[h,w] = size(img);
LaplacianNum=0;%经Laplacian操作得到的每个像素的值
LaplacianThreshold=0.2;%设定阈值
for j=2:h-1 %进行边界提取
    for k=2:w-1
        LaplacianNum=abs(4*img(j,k)-img(j-1,k)-img(j+1,k)-img(j,k+1)-img(j,k-1));
        if(LaplacianNum > LaplacianThreshold)
            lapulasiimg(j,k)=255;
        else
            lapulasiimg(j,k)=0;
        end
    end
end
%拉普拉斯