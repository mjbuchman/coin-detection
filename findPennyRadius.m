function averagePennyR = findPennyRadius(pennyCenters, pennyRadii)
    if size(pennyCenters) == 0
        msg = 'Error: No pennies in image';
        error(msg)
    end

    % Find the average penny radius
    averagePennyR = 0;
    for i = 1:size(pennyRadii,1)
        averagePennyR = averagePennyR + pennyRadii(i);
    end
    averagePennyR = averagePennyR/size(pennyRadii, 1);
end