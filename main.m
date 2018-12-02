img = imread('C:\Users\d\Desktop\Fall2018\CS534\534Project\test-images\70c.jpg');
img = imresize(img, 0.5);
grayimg = rgb2gray(img);

%light
adapthisteq(grayimg);
I = imtophat(grayimg,strel('disk',200));
bw = imbinarize(I);
bw = bwareaopen(bw, 50);
imshow(bw);

hsv_image = rgb2hsv(img);
BW_HSV = im2bw(hsv_image, 0.36);
imshow (BW_HSV);
penny_mask = imfill(BW_HSV, 'holes');
penny_mask = medfilt2(penny_mask, [10 10]);
imgPenny = img;

imgPenny(:,:,1) = double(imgPenny(:,:,1)).*penny_mask;
imgPenny(:,:,2) = double(imgPenny(:,:,2)).*penny_mask;
imgPenny(:,:,3) = double(imgPenny(:,:,3)).*penny_mask;

% rgb image with only other silver coins on it
imgOther = img - imgPenny;
imshow(imgPenny);
  
[circleCenters, circleRadii] = findCircles(imgPenny);
[otherCenters, otherRadii] = findCircles(imgOther);

if size(circleCenters) == 0
    msg = 'Error: No pennies';
    error(msg)
    exit;
end


