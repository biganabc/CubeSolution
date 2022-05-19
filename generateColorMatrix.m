function colorMatrix = generateColorMatrix(surfaces, colors)

    colorMatrix = 0.7451 * ones(1,6,3,27);
    
    % 每个面的小立方体序号
    faceIndex(:,:,1) = [7 4 1; 16 13 10; 25 22 19];
    faceIndex(:,:,2) = [1 2 3; 10 11 12; 19 20 21];
    faceIndex(:,:,3) = [3 6 9; 12 15 18; 21 24 27];
    faceIndex(:,:,4) = [9 8 7; 18 17 16; 27 26 25];
    faceIndex(:,:,5) = [7 8 9; 4 5 6; 1 2 3];
    faceIndex(:,:,6) = [19 20 21; 22 23 24; 25 26 27];
    
    % “贴颜色”
    for i = 1:6
        colorMatrix(1,i,:,faceIndex(:,:,i)) = colors(:,surfaces(:,:,i));
    end
    
end