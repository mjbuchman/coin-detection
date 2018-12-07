% Averages the radii of the pennies found in the image.
% 
% Input:
% pennyCenters: Coordinates of the pennies.
% pennyRadii:   Radii of the pennies.
% 
% Outputs: 
% averagePennyR: Average of the penny radii.
%--------------------------------------------------------------------------

function [d,averagePennyR] = findPennyRadius(pennyCenters, pennyRadii, img)
if size(pennyCenters) == 0
    % If no pennies in image, default to manually finding a radius to use
    coinType = manualRadiusGUI;
    [d,averagePennyR] = calculatePennyRadius(img, coinType);
else
    % Find the average penny radius
    averagePennyR = mean(pennyRadii);
    d = 0;
end