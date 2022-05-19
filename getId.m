function id = getId(state, phase)
%getId 求魔方当前状态的 id
%   根据魔方状态和当前阶段计算魔方的 id
    if phase == 1
        t1 = [0, 1, 2, 2^2, 2^3, 2^4, 2^5, 2^6, 2^7, 2^8, 2^9, 2^10];
        t2 = state(21:32);
        id = uint64(sum(t1 .* t2));
        return;
    elseif phase == 2
        t1 = [0, 1, 3^1, 3^2, 3^3, 3^4, 3^5, 3^6];
        t2 = state(33:40);
        t3 = sum(t1 .* t2);
        t4 = uint64(0);
        for i = 1:12
            % result[0] |= (state[e] / 8) << e;
            t4 = bitor(t4, bitshift(uint64(floor(state(i) / 8)), i - 1));
        end
        id = t4 + bitshift(uint64(t3), 12);
        return;
    elseif phase == 3
        t1 = uint64(0);
        for i = 1:12
            if state(i) > 7
                t1 = bitor(t1, bitshift(2, 2 * i - 2));
            else
                t1 = bitor(t1, bitshift(bitand(state(i), uint64(1)), 2 * i - 2));
            end
        end
        t2 = uint64(0);
        for i = 1:8
            t2 = bitor( t2, bitshift( bitand(uint64(state(i + 12) - 12), uint64(5)), i * 3 - 3) );
        end
        t3 = uint64(0);
        for i = 13:19
            for j = i + 1 : 20
                t3 = bitxor(t3, uint64(state(i) > state(j)));
            end
        end
        id = bitor(bitshift(t3, 48), bitor(bitshift(t2, 24), t1));
        return;
    else
        t1 = [0, 1, 12, 12^2, 12^3, 12^4, 12^5, 12^6, 12^7, 12^8, 12^9, 12^10];
        t2 = uint64(sum(state(1:12) .* t1));
        t3 = [0, 1, 8, 8^2, 8^3, 8^4, 8^5, 8^6];
        t4 = uint64(sum(state(13:20) .* t3));
        id = t4 + bitshift(t2, 22);
        return;
    end
end

