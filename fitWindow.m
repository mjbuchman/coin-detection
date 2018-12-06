% Resize image to fit GUI axes2 by adding padding to image
% 
% Input:
% img: Image to be resized
% height: New desired height
% width: New desired width
% 
% Outputs: 
% newImg: The resized image
%--------------------------------------------------------------------------
function newImg = fitWindow(img, height, width)
   % Proportionally shrink image until smaller than new desired size
   while (size(img,1) >= height || size(img,2) >= width)
       img = imresize(img, .9);
   end
   
   % Find the amount of padding to be added to each side
   heightDiff = round((height - size(img,1))/2);
   widthDiff = round((width - size(img,2))/2);
   
   % Add padding to all sides and return image
   newImg = padarray(img, [heightDiff widthDiff], 'both');
end