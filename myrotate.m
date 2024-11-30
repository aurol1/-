function rotateimg = myrotate(img,angle)
angle = angle / 180 * pi;
[H,W,C] = size(img);
H_new = round(H*abs(cos(angle))+ W*abs(sin(angle)));           
W_new = round(W*abs(cos(angle))+ H*abs(sin(angle)));             
rotateimg= zeros(H_new,W_new,C);          
M1 = [1 0 0; 0 -1 0; -0.5*W_new 0.5*H_new 1];                    
M2 = [cos(angle) sin(angle) 0; -sin(angle) cos(angle) 0; 0 0 1]; 
M3 = [1 0 0; 0 -1 0; 0.5*W 0.5*H 1];
for i = 1:W_new
   for j = 1:H_new
      temp = [i j 1]*M1*M2*M3;                                   %得到旋转后的矩阵temp
      x = round(temp(1));                                       
      y = round(temp(2));                                        
      
      if y < 1 || x < 1 || y > H || x > W                        %防止边界溢出
          rotateimg(j, i) = 0;
      else
                                                                 %双线性插值
                                                                 %计算四个角点的坐标(四邻域)
          left = floor(x);                                       %左边界
          right = ceil(x);                                       %右边界
          top = floor(y);                                        %上边界
          bottom = ceil(y);                                      %下边界
                                                
          a = x - left;                                          %取小数部分
          b = y - top;                                           %取小数部分
                                                                 %双线性插值计算
          rotateimg(j, i, 1) = (1-a)*(1-b)*img(top, left, 1) + a*(1-b)*img(top, right, 1) + ...
              (1-a)*b*img(bottom, left, 1) + a*b*img(bottom, right, 1);
          rotateimg(j, i, 2) = (1-a)*(1-b)*img(top, left, 2) + a*(1-b)*img(top, right, 2) + ...
              (1-a)*b*img(bottom, left, 2) + a*b*img(bottom, right, 2);
          rotateimg(j, i, 3) = (1-a)*(1-b)*img(top, left, 3) + a*(1-b)*img(top, right, 3) + ...
              (1-a)*b*img(bottom, left, 2) + a*b*img(bottom, right, 3);
      end
   end
end
figure;
imshow(uint8(rotateimg));
title('缩放图像');