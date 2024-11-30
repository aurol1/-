function histgram = mygraypram(img)
%img = my2gray(img);
histgram = zeros(1,256);
[h,w] = size(img);
for i =1:h
    for j = 1:w
        k = img(i,j);
        histgram(k+1) = histgram(k+1)+1;
    end
end
figure;
bar(histgram)
title('灰度直方图');

