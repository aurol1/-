function visualization = hog_tezheng(image)

grayImage = rgb2gray(image); % 转换为灰度图

% 归一化
grayImage = im2double(grayImage); % 将图像数据类型转换为double，并归一化到[0,1]

% 提取HOG特征
[featureVector, visualization] = extractHOGFeatures(grayImage, ...
    'CellSize', [16 16], ... 
    'NumBins', 8, ...       
    'BlockSize', [1 1]);     

 % % 显示原始灰度图像
 %    subplot(1, 1, 1);
 %    imshow(grayImage);
 %    title('HOG Features Overlayed on Input Image');
 %    hold on; % 保持当前图像
 % 
 %    % 在原始图像上叠加HOG特征可视化
 %    plot(visualization, 'Color', 'red'); 
 %    hold off; % 释放当前图像