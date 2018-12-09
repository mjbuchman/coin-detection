% Allows user to manually select a coins radius to measure and displays
% an interactive line to be overlaid across a coin
% Then calculates the theoretical radius of a penny at this image's scale 
% 
% Input:
% img: The original image chosen by user
% coinType: The type of coin selected by user in popup menu
% 
% Outputs: 
% d: The user's chosen coin radius
% pennyRadius: Calculated penny radius at this scale
%--------------------------------------------------------------------------

function [d,pennyRadius] = calculatePennyRadius(img, coinType)
    % Show image and allow user to select a diameter
    imshow(img);
    h = imdistline(gca, [300 400], [277 277]);
    wait(h);
    
    % Calculate the radius of that coin
    d = getDistance(h);
    d = d/2;
    
    % Calculate the theoretical size of a penny at this scale
    if strcmp(coinType,' Quarter')
        pennyRadius = d*.785;
    elseif strcmp(coinType,' Nickel')
        pennyRadius = d*.8982;
    else
        pennyRadius = d*1.064;
    end
end 