function histeq = myhisteq(img)
img = my2gray(img);
[h,w]=size(img);
p=zeros(1,256);
for i=0:255
   % 用length函数计算相同像素的个数
   p(i+1)=length(find(img==i))/(h*w);  
end 
t=zeros(1,256);  
for i=1:256  
     for j=1:i  
         t(i)=p(j)+t(i);                  
     end  
end  
%像素点映射
a=round(t*255);  
b=img;  
for i=0:255  
     b(img==i)=a(i+1);                
end 
for i=0:255  
    histeq(i+1)=sum(p(a==i));            
end
figure;
bar(0:255,histeq,'b')
title('灰度直方图均衡化');

