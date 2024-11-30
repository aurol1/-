function resizeimg = myresize(img,n)
[h,w,r] = size(img);
dh = round(h * n);
dw = round(w * n);
resizeimg = zeros(dh,dw,r);
for di = 1:dh
    for dj = 1:dw
        ii = di / n;jj = dj / n;
        i = floor(ii);j = floor(jj);
        u = ii - i;v = jj - j;
        i = i + 1;j = j + 1;
        %边界处理
        if (i < 1)
            i = 1;
        end
        if (j < 1)
            j = 1;
        end
        if((i + 1) > h)
            i = h - 1;
        end
        if((j + 1) > w)
            j = w -1;
        end
        %线性插值公式
        resizeimg(di,dj,:) = (1 - u) * (1 - v) * img(i,j,:) + (1 - u) * v * img(i,j + 1,:) + u * (1 - v) * img(i + 1,j,:) + u * v * img(i + 1,j + 1,:);
    end
end
resizeimg = uint8(resizeimg);
figure;
imshow(resizeimg);
title('缩放图像');