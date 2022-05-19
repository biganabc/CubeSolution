function newState = applyMove(move, oldState)
%applyMove ִ����ת����
%   ת���� 0 - 17 �����ֽ��б��
    affectedCubies = uint8([
            0,  1,  2,  3,  0,  1,  2,  3 ;  % U
            4,  7,  6,  5,  4,  5,  6,  7 ;  % D
            0,  9,  4,  8,  0,  3,  5,  4 ;  % F
            2, 10,  6, 11,  2,  1,  7,  6 ;  % B
            3, 11,  7,  9,  3,  2,  6,  5 ;  % L
            1,  8,  5, 10,  1,  0,  4,  7 ;  % R
    ]);
    face = uint8(floor(move / 3)) + 1;
    turns = uint8(mod(move, 3) + 1);
    newState = oldState;
    for j=1:turns
        currentState = newState;    % �����״̬
        for i=1:8
            % ��ת���Ƿ��ǽǿ�
            isCorner = i > 4;
            % Ҫ��ת�Ŀ�ı��
            target = affectedCubies(face, i) + isCorner*12 + 1; 
            if i == 4 || i == 8
                t = i - 3;
            else
                t = i + 1;
            end
            % ת���� target λ�õĿ��� oldState �еı��
            killer = affectedCubies(face, t) + isCorner*12 + 1;
            % ����Ƕȱ仯��
            if i <= 4
                % ֻ�� F, B ���ת����Ӱ�쵽���ĽǶ�
                orientationDelta = face >= 3 && face <= 4;
            else
                if face <= 2
                    orientationDelta = 0;
                else
                    orientationDelta = 2 - (mod(i, 2) == 0);
                end
            end
            newState(target) = currentState(killer);
            newState(target+20) = currentState(killer+20) + orientationDelta;
            % ���һ����ת��Ҫ���Ƕȹ淶�� 0 - 2 ֮��
            if j == turns 
                newState(target+20) = mod(newState(target+20), 2 + isCorner);
            end
        end
    end
end

