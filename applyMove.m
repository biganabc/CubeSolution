function newState = applyMove(move, oldState)
%applyMove 执行旋转动作
%   转动由 0 - 17 的数字进行编号
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
        currentState = newState;    % 保存旧状态
        for i=1:8
            % 旋转的是否是角块
            isCorner = i > 4;
            % 要旋转的块的编号
            target = affectedCubies(face, i) + isCorner*12 + 1; 
            if i == 4 || i == 8
                t = i - 3;
            else
                t = i + 1;
            end
            % 转动到 target 位置的块在 oldState 中的编号
            killer = affectedCubies(face, t) + isCorner*12 + 1;
            % 计算角度变化量
            if i <= 4
                % 只有 F, B 面的转动会影响到棱块的角度
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
            % 最后一次旋转后要将角度规范到 0 - 2 之间
            if j == turns 
                newState(target+20) = mod(newState(target+20), 2 + isCorner);
            end
        end
    end
end

