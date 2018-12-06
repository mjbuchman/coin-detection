function pennyRadius = calculatePennyRadius(img)
    imshow(img);
    h = imdistline;
    wait(h);
    d = getDistance(h);
    pennyRadius = (d/2)*.785;
end