% Averages the radii of the pennies found in the image.
% 
% Input:
% pennyCenters: Coordinates of the pennies.
% pennyRadii:   Radii of the pennies.
% 
% Outputs: 
% averagePennyR: Average of the penny radii.
%--------------------------------------------------------------------------

function averagePennyR = findPennyRadius(pennyCenters, pennyRadii, img)
if size(pennyCenters) == 0
    %averagePennyR = calculatePennyRadius(img);
    msg = 'Error: No pennies in image';
    error(msg)
else
    % Find the average penny radius
    averagePennyR = mean(pennyRadii);
end