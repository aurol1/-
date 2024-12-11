function im = myrotate(img,angle)
[m,n,d] = size(img); 
        
% 由于matlab中cos，sin角度为弧度，故进行转换
a = angle*pi/180;

% 原图像四个顶点行坐标、列坐标(逆时针)
r1 = 1; r2 = m; r3 = m; r4 = 1;
c1 = 1; c2 = 1; c3 = n; c4 = n;
x = [r1,r2,r3,r4];         % 向量
y = [c1,c2,c3,c4];

% 根据旋转公式，得旋转后的坐标(x,y为原始图像坐标，x1,y1为旋转后坐标)
x1 = round(x*cos(a)-y*sin(a));
y1 = round(x*sin(a)+y*cos(a));

% 计算x1 y1的最大、最小值
x1_max = max(x1);
y1_max = max(y1);
x1_min = min(x1);
y1_min = min(y1);

% 得出画布扩展后的大小为m2,n2
m2 = x1_max - x1_min + 1;
n2 = y1_max - y1_min + 1;

% 计算x和y方向平移量det_x,det_y
if x1_min<=0
    delta_x = abs(x1_min)+1;
else
    delta_x = 0;
end
if y1_min<=0
    delta_y = abs(y1_min)+1;
else
    delta_y = 0;
end

% 初始化新图矩阵
im = ones(m2,n2,d)*(-1); % 要进行黑洞填充为判断非背景点，画布初始化-1(非法值)

% 对原图的每一行，每一列,根据旋转公式和平移量，得原新图对应坐标
for i=1:m
    for j=1:n
        x = round(i*cos(a)-j*sin(a)) + delta_x;
        y = round(i*sin(a)+j*cos(a)) + delta_y;
        im(x,y,:)=img(i,j,:);
    end
end

% 进行插值--R通道
im_1 = im(:,:,1);

% 对新图的每一行
for i=1:m2
    % 找出新图第i行所有非背景点的行列坐标
    [x_1,y_1] = find(im_1(i,:)>0); % 找出所有大于0的点
    
    % 求第i行所有非背景点的列坐标的起止值
    y1_min = min(y_1);
    y1_max = max(y_1);
    
    % 在(y1_min,y_1max)范围内进行插值,对y1_min,y_1max之间的每一个像素点
    for j=y1_min+1:y1_max
        % 若为背景点，将前一个点赋给该点
        if(im(i,j)<0)
            im(i,j,:)=im(i,j-1,:);
        end
    end
end

end
%旋转