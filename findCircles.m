function [centers, radii] = findCircles(bw)
[centers,radii] = imfindcircles(bw, [50 300], 'Method', 'TwoStage', 'Sensitivity', 0.9);
viscircles(centers,radii, 'EdgeColor', 'b');
end