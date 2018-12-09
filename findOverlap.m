function flag_error = findOverlap(allCenters, allRadii)
for i = 1 : size(allCenters) - 1 
bboxA = [allCenters(i,1)-allRadii(i), allCenters(i,2)-allRadii(i), allRadii(i)*2, allRadii(i)*2];
    for j = i+1 : size(allCenters) - 1
        bboxB = [allCenters(j+1,1)-allRadii(j+1), allCenters(j+1,2)-allRadii(j+1), allRadii(j+1)*2, allRadii(j+1)*2];
        overlapRatio = bboxOverlapRatio(bboxA, bboxB);
        if overlapRatio > 0.3
        flag_error = 1;
        return;
        end
    end
flag_error = 0;
end
return;
    
    
