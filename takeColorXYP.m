function goodPoints = takeColorXYP(image)
goodPoints = zeros(size(image));

[row, col] = ind2sub(size(image),find(image(:,:)<40));
for i = 1 : length(row)
    goodPoints(row(i),col(i)) = 1;
end
debug = 0;
if (debug)
imshow(goodPoints);
end

