% Label the coin with its face value
% 
% Input:
% x:        X coordinate of center of the coin
% y:        Y coordinate of the center of the coin
% r:        Radius of the coin
% value:    Value of the coin
%
% Output:
% Prints the value of the coin onto its face
%--------------------------------------------------------------------------

% function labelCoin(x,y,r)
%     th = 0:pi/50:2*pi;
%     xunit = r * cos(th) + x;
%     yunit = r * sin(th) + y;
%     plot(xunit, yunit, 'MarkerFaceColor', 'black');
% end

function labelCoin(x,y,r,value)
    txt = sprintf('%d',value);
    text(x,y,txt,'FontSize',r/2,'Color','red','FontWeight','bold','HorizontalAlignment','center');
end