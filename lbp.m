function lbpimg = lbp(img)
img = im2double(img);
img = my2gray(img);
[h,w]=size(img);
z=zeros(8,1);
lbpimg=zeros(h,w);
for i=2:h-1
    for j=2:w-1        
        t=1;
        for k=-1:1
            for l=-1:1                
                if (k~=0)||(l~=0)
                if (img(i+k,j+l)-img(i,j)<0) %二进制
                    z(t)=0;
                else
                    z(t)=1;
                end
                t=t+1;
                end
            end
        end
        
        for t=0:7
           lbpimg(i,j)=lbpimg(i,j)+((2^t)*z(t+1));  
        end
    end
end
lbpimg=uint8(lbpimg);
%lbp
