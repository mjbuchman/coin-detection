% Main method of the coin detection program.
% 
% 
% Outputs: 
% Displays the total value of coins found in an image on the image
% provided.
%--------------------------------------------------------------------------

%% ---------------------------- Load images -------------------------------
% Change this number to test different images (alphabetical sorting)
imgnum = 2;

% Check if test image folder is present
test_imgs_dir = [pwd, '/test-images/'];
if ~isdir(test_imgs_dir)
    error = sprintf('Error: Folder does not exist.\n');
    uiwait(warndlg(error));
    return;
end
imagelist = dir(test_imgs_dir);

% Remove unwanted files, if present
imagelist = imagelist(arrayfun(@(x) ~strcmp(x.name, 'Thumbs.db'), imagelist));
imagelist = imagelist(arrayfun(@(x) x.name(1) ~= '.', imagelist));

% Get filename and load
filename = fullfile(test_imgs_dir, imagelist(imgnum).name);
img = imread(filename);

% Scale down image and convert to gray
img = imresize(img, 0.5);
grayimg = rgb2gray(img);

% Make lighting uniform and binarize image
adapthisteq(grayimg);
I = imtophat(grayimg,strel('disk',200));
bw = imbinarize(I);
bw = bwareaopen(bw, 50);

%% ---------------------------- Find Pennies-------------------------------
% Convert image to HSV (hue, saturation, value) to find the pennies
hsv_image = rgb2hsv(img);
BW_HSV = im2bw(hsv_image, 0.36);
%BW_HSV = im2bw(hsv_image, 0.5); % Testing
penny_mask = imfill(BW_HSV, 'holes');
penny_mask = medfilt2(penny_mask, [10 10]);
imgPenny = img;

% Create rgb picture of pennies from mask
imgPenny(:,:,1) = double(imgPenny(:,:,1)).*penny_mask;
imgPenny(:,:,2) = double(imgPenny(:,:,2)).*penny_mask;
imgPenny(:,:,3) = double(imgPenny(:,:,3)).*penny_mask;

[pennyCenters, pennyRadii] = findCircles(imgPenny);

% Check for pennies and return the average radius of all pennies in image
averagePennyR = findPennyRadius(pennyCenters, pennyRadii, img);
%imshow(imgPenny);

%% ---------------------------- Detect Other Coins ------------------------
% Show original image
imshow(img);
hold on;

% Detect (and visualize) other coins
[allCenters, allRadii] = findCircles(bw);

%% ---------------------------- Count All Coins ---------------------------
% Compare all radii to the penny and count total change
% Also calls method to visually overlay value on each coin
total = compareAndCount(averagePennyR, pennyCenters, allCenters, allRadii);

% Draw rectangle with total on the image
[x, y] = size(img);
pos = [0 0.9*x 0.1*y 0.1*x];
rectangle('Position',pos,'FaceColor','Black');

% Put total value text in the rectangle
total = round(total/100, 2);
txt = sprintf('Total: $%.2f',total);
text(0.05*y, 0.95*x, txt, 'Color','White','FontSize',0.01*y,...
    'FontWeight','Bold','HorizontalAlignment','center');

