% Compares the radii of the coins in an image with the radii of the pennies.
% 
% Input:
% averagePR:    Average of all the penny radii found in the image
% centers:      Centers of all coins found in the image
% radii:        Radii of all coins found in image
% 
% Outputs: 
% total:        Total of the coins in the image.
%--------------------------------------------------------------------------

function total = compareAndCount(averagePR, pennyCenters, centers, radii)
    total = 0;
 
    % Ratio constants - Found by dividing penny radius by other radius
    QUARTER_HIGH_BOUND = .85;   % Ratio = .785
    NICKEL_HIGH_BOUND = .97;    % Ratio = .8982
    DIME_LOW_BOUND = 1.02;      % Ratio = 1.064
    
    % Iterate through list and determine coins value
    for i = 1:size(radii,1)
        % Find ratio of current coin
        r = averagePR/radii(i);
        x = centers(i,1);
        y = centers(i,2);
        penny = 0; %boolean value to indicate if curr is a penny
        
        % Pennies (do it this way to fix pennies being mistaken as dimes)
        for j=1:size(pennyCenters,1)
            pX = pennyCenters(j,1);
            pY = pennyCenters(j,2);
            if(x>pX-10 && x<pX+10 && y>pY-10 && y<pY+10)
                total = total + 1;
                labelCoin(x,y,radii(i),1);
                %labelCoinIndex(x,y,radii(i),i);
                penny = 1;
            end
        end
        
        % Prevents pennies from getting into the other if statements
        if(penny == 1) 
            continue;
        end
        
        % Dimes
        if (r >= DIME_LOW_BOUND)
            % Fix pennies being counted as dimes
            total = total + 10;
            labelCoin(x,y,radii(i),10);
            %labelCoinIndex(x,y,radii(i),i);
            
        % Nickels
        elseif (r >= QUARTER_HIGH_BOUND && r < NICKEL_HIGH_BOUND)
            total = total + 5;
            labelCoin(x,y,radii(i),5);
            %labelCoinIndex(x,y,radii(i),i);
            
        % Quarters
        else
            total = total + 25;
            labelCoin(x,y,radii(i),25);
            %labelCoinIndex(x,y,radii(i),i);
        end
    end
end