function robertimg = robert(img)
img = my2gray(img);
[h,w] = size(img);
robertsNum=0;
robertThreshold=0.2;
for j=1:h-1
    for k=1:w-1
        robertsNum = abs(img(j,k)-img(j+1,k+1)) + abs(img(j+1,k)-img(j,k+1));
        if(robertsNum > robertThreshold)
            robertimg(j,k)=255;
        else
            robertimg(j,k)=0;
        end
    end
end
%robert