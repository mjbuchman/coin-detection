function total = compareAndCount(averagePR, centers, radii)
    total = 0;
 
    % Ratio constants - Found by dividing penny radius by other radius
    QUARTER_HIGH_BOUND = .85;   % Ratio = .785
    NICKEL_HIGH_BOUND = .98;    % Ratio = .8982
    DIME_LOW_BOUND = 1.02;      % Ratio = 1.064
    % Iterate through list and determine coins value
    for i = 1:size(radii,1)
        r = averagePR/radii(i);
        if (r >= DIME_LOW_BOUND)
            total = total + 10;
            labelCoin(centers(i,1),centers(i,2),radii(i));
        elseif (r >= NICKEL_HIGH_BOUND && r < DIME_LOW_BOUND)
            total = total + 1;
        elseif (r >= QUARTER_HIGH_BOUND && r < NICKEL_HIGH_BOUND)
            total = total + 5;
        else
            total = total + 25;
        end
    end
end