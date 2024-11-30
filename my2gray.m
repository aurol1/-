function grayImg = my2gray(image)
    r = image(:,:,1);
    g = image(:,:,2);
    b = image(:,:,3);
    grayImg = 0.299*r+0.587*g+0.114*b;