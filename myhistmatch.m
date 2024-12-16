function histmatch = myhistmatch(img)
img = my2gray(img);
[h,w] = size(img);
n_1=zeros(1,256);
for i=1:h
    for j=1:w
        n_1(img(i,j)+1)=n_1(img(i,j)+1)+1;
    end
end
n_1=n_1/h/w;
p_1=zeros(1,256);
for i=1:256
    for j=1:i
        p_1(i)=p_1(i)+n_1(j);
    end
end
n_2=[zeros(1,50),0.1,zeros(1,50),0.2,zeros(1,50),0.3,zeros(1,50),0.2,zeros(1,20),0.1,zeros(1,30),0.1];
p_2=zeros(1,256);
for i=1:256
    for j=1:i
        p_2(i)=p_2(i)+n_2(j);
    end
end
data_1=zeros(1,256);

for i=1:256
    min=abs(p_1(i)-p_2(1));
    for j=2:256
        if  abs(p_1(i)-p_2(j))<min
            min=abs(p_1(i)-p_2(j));
            data_1(i)=j-1;
        end
    end
end
histmatch  = img;
for i=1:h
    for j=1:w
       histmatch (i,j)=data_1(img(i,j)+1);
    end
end
histmatch = mygraypram(histmatch);



