%% ---------------------------- Load images -------------------------------
img = imread('test-images\42c.jpg');
img = imresize(img, 0.5);
grayimg = rgb2gray(img);

% Make lighting uniform and binarize image
adapthisteq(grayimg);
I = imtophat(grayimg,strel('disk',200));
bw = imbinarize(I);
bw = bwareaopen(bw, 50);

%% ---------------------------- Find Pennies-------------------------------
hsv_image = rgb2hsv(img);
BW_HSV = im2bw(hsv_image, 0.36);
penny_mask = imfill(BW_HSV, 'holes');
penny_mask = medfilt2(penny_mask, [10 10]);
imgPenny = img;

imgPenny(:,:,1) = double(imgPenny(:,:,1)).*penny_mask;
imgPenny(:,:,2) = double(imgPenny(:,:,2)).*penny_mask;
imgPenny(:,:,3) = double(imgPenny(:,:,3)).*penny_mask;

[pennyCenters, pennyRadii] = findCircles(imgPenny)

% Check for pennies and return the average radius of all pennies in image
averagePennyR = findPennyRadius(pennyCenters, pennyRadii)

%% ---------------------------- Detect Other Coins ------------------------
% Show original image
imshow(img);
hold on;

% Detect (and visualize) other coins
[allCenters, allRadii] = findCircles(bw)

%% ---------------------------- Count All Coins ---------------------------
% Compare all radii to the penny and count total change
% Also calls method to visually overlay value on each coin
total = 0;
total = total + compareAndCount(averagePennyR, allCenters, allRadii)


