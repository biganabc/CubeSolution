function faceAxis = calculateFaceAxis(center, offsetMatrix, facePoint)
    faceAxis = zeros(4,6,3);
    
    for i = 1:6 
        % 第i个面4个点的偏移矩阵 4*3
        tmp = offsetMatrix(facePoint(i,:),:);
        % faceAxis(:,i,1)表示第i个面的x坐标，(:,i,2)表示第i个面的y坐标，(:,i,3)表示第i个面的z坐标
        faceAxis(:,i,:) = tmp + center;
    end 

end