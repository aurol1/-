function mubiaoimg = mubiao(img,bg)
img = im2double(img);
bg = im2double(bg);
[rows, cols,~] = size(img);
bg = imresize(bg, [rows, cols]);
bg = repmat(bg, [1, 1, 3]);
mubiaoimg = img.*bg;
%提取目标