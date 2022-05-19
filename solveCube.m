function solution = solveCube(start)
%solveCube 解魔�?
%   输入：魔方的六个�?
%   输出：解法字符串
    solution = ["start"];
    goalState = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    currentState = prepareCube(start);
    waitList = ["wait1.png","wait2.png","wait3.png","wait4.png"];
    for phase=1:4
        jFrame = wait(waitList(phase));
        counter = 0;
        goalId = getId(goalState, phase);
        currentId = getId(currentState, phase);

        % 不需转动，直接相等，则进入下�?阶段
        if currentId == goalId
            continue;
        end

        % 初始化进行广度优先搜索用的队�?
        queue = zeros(20000, 40);
        queue(1, :) = currentState;
        queue(2, :) = goalState;
        head = 1;
        tail = 3;

        % 前继
        predecessor = containers.Map({uint64(1)}, {goalState});
        remove(predecessor, uint64(1));
        % 搜索方向：向前为 1，向后为 0
        direction = containers.Map({currentId, goalId}, {1, 2});
        % 上一部操�?
        lastMove = containers.Map({uint64(1)}, {0});
        remove(lastMove, uint64(1));

        while 1
            isEnd = 0;
            % 取出队列�?头的状�??
            oldState = queue(head,:);
            head = head + 1;
            % 计算旧状态的 id
            oldId = getId(oldState, phase);
            oldDir = direction(oldId);
            % 遍历可行步骤
            for move = 0:17
                if isMoveApplicable(move, phase)
                    % 操作魔方
                    newState = applyMove(move, oldState);
                    newId = getId(newState, phase);
                    % �?查是否到达过这个 id
                    try
                        newDir = direction(newId);
                        % 没有错误证明该状态已经被访问过了
                        % 前后状�?�不相等，证明是从两边相遇了
                        if oldDir ~= newDir 
                            % �? old 为前向，new 为后�?
                            if oldDir > 1
                                temp = oldId;
                                oldId = newId;
                                newId = temp;
                                move = inverse(move);
                            end
                            % 记录是每次执行的步骤编号
                            algorithm = [move];
                            % 记录�? current -> old �?用的步骤
                            while oldId ~= currentId
                                algorithm(2:length(algorithm) + 1) = algorithm;
                                algorithm(1) = lastMove(oldId);
                                oldId = predecessor(oldId);
                            end
                            % 记录�? new -> goal �?用的步骤
                            while newId ~= goalId 
                                algorithm(length(algorithm) + 1) = inverse(lastMove(newId));
                                newId = predecessor(newId);
                            end
                            % 保存结果
                            f = ["U", "D", "F", "B", "L", "R"];
                            for k = 1:length(algorithm)
                                face = uint8(floor(algorithm(k) / 3)) + 1;
                                turns = uint8(mod(algorithm(k), 3) + 1);
                                solution(length(solution) + 1) = strcat(f(face), int2str(turns));
                                currentState = applyMove(algorithm(k), currentState);
                            end
                            isEnd = 1;
                            break
                        end
                    catch
                        % 有异常，证明这个状�?�没有被访问�?
                        if tail > length(queue) % �?次扩�? 100 防止频繁扩容造成性能损失
                            queue(tail + 999, 1) = 0;
                        end
                        % 记录新状态的各个指标
                        counter = counter + 1;
                        queue(tail, :) = newState;
                        tail = tail + 1;
                        direction(newId) = oldDir;
                        lastMove(newId) = move;
                        predecessor(newId) = oldId;
                    end
                end
            end

            if isEnd
                break
            end

        end
        jFrame.dispose;
    end
    solution = solution(2:length(solution));
end

