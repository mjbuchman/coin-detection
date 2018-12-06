% Find and visualize coins in an image.
% 
% Input:
% bw: Binary image of the coins
% 
% Outputs: 
% centers:  Array of centers of all coins found by imfindcircles
% radii:    Array of radii of all coins found by imfindcircles
%--------------------------------------------------------------------------

function [centers, radii] = findCircles(bw)

% Use imfindcircles to find all coins in bw image
[centers,radii] = imfindcircles(bw, [30 300], 'Method', 'TwoStage', 'Sensitivity', 0.9);

% Suppress warning from imfindcircles
warning('off','last');

% Show circles found by imfindcircles on img
viscircles(centers,radii, 'EdgeColor', 'b');
end