function faceAxis = calculateFaceAxis(center, offsetMatrix, facePoint)
    faceAxis = zeros(4,6,3);
    
    for i = 1:6 
        % ��i����4�����ƫ�ƾ��� 4*3
        tmp = offsetMatrix(facePoint(i,:),:);
        % faceAxis(:,i,1)��ʾ��i�����x���꣬(:,i,2)��ʾ��i�����y���꣬(:,i,3)��ʾ��i�����z����
        faceAxis(:,i,:) = tmp + center;
    end 

end