% Main method of the coin detection program.
% 
% 
% Outputs: 
% Displays the total value of coins found in an image on the image
% provided.
%--------------------------------------------------------------------------

function main(path, oFlag)
%% ---------------------------- Load images -------------------------------
% Change this number to test different images (alphabetical sorting)
imgnum = 1;

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
img = imread(path); % CHANGE "path" TO "filename" TO BYPASS GUI INPUT

% Scale image to fit in window
img = fitWindow(img, 544, 700);

%% ----------------------- Edit Image Before Processing -----------------------
% Convert image to grayscale
grayimg = rgb2gray(img);

% Make lighting uniform and binarize image
adapthisteq(grayimg);
I = imtophat(grayimg,strel('disk',200));
bw = imbinarize(I);
bw = bwareaopen(bw, 50);


% Find circles
[allCenters, allRadii] = findCircles(bw);

% Create mask
x = 1:size(img,2);
y = 1:size(img,1);
[xx,yy] = meshgrid(x,y);
mask = zeros(size(img,1), size(img,2));
for i=1 : size(allRadii)
    a = round(allCenters(i,1));
    b = round(allCenters(i,2));
    mask = mask | (hypot(xx-a, yy - b) <= allRadii(i));
end

% Multiply image by the mask to delete background
img(:,:,1) = double(img(:,:,1)).*mask;
img(:,:,2) = double(img(:,:,2)).*mask;
img(:,:,3) = double(img(:,:,3)).*mask;

%% ---------------------------- Find Pennies-------------------------------
% Convert image to HSV (hue, saturation, value) to find the pennies
hsv_image = rgb2hsv(img);
BW_HSV = im2bw(hsv_image, 0.25); % Was 0.36
penny_mask = imfill(BW_HSV, 'holes');
penny_mask = medfilt2(penny_mask, [10 10]);
imgPenny = img;

% Create rgb picture of pennies from mask
imgPenny(:,:,1) = double(imgPenny(:,:,1)).*penny_mask;
imgPenny(:,:,2) = double(imgPenny(:,:,2)).*penny_mask;
imgPenny(:,:,3) = double(imgPenny(:,:,3)).*penny_mask;

[pennyCenters, pennyRadii] = findCircles(imgPenny);

% Check for pennies and return the average radius of all pennies in image
[d, averagePennyR] = findPennyRadius(pennyCenters, pennyRadii, img);

%% ----------------------- Detect Overlapping Coins -----------------------
% Show original image
cla;
imshow(img);
hold on;

if oFlag
    flag_error = findOverlap(allCenters, allRadii);
    if flag_error == 1
        overlapError;
        uiwait;
        cla;
        clearvars;
        imshow('resources/processing-screen.jpg');
        uiwait;
    end
end
%% --------------------- Manual Radius Error Checking ---------------------
% If calculatePennyRadius needed to be called
% Check if the found radius is within an acceptable range of any coin
radiusFlag = 1;
if d ~= 0
    radiusFlag = 0;
    for i = 1:size(allRadii)
        if (allRadii(i) > d - 4) && (allRadii(i) < d + 4)
            radiusFlag = 1;
        end
    end
end

% If radius did not match any range, throw an error message and reset
if ~radiusFlag
    radiusError;
    uiwait;
    cla;
    clearvars -except path oFlag;
    imshow('resources/processing-screen.jpg');
    main(path, oFlag);
end
    
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

