% Averages the radii of the pennies found in the image.
% 
% Input:
% pennyCenters: Coordinates of the pennies.
% pennyRadii:   Radii of the pennies.
% 
% Outputs: 
% averagePennyR: Average of the penny radii.
%--------------------------------------------------------------------------

function averagePennyR = findPennyRadius(pennyCenters, pennyRadii)
if size(pennyCenters) == 0
    msg = 'Error: No pennies in image';
    error(msg)
end

% Find the average penny radius
averagePennyR = mean(pennyRadii);
end