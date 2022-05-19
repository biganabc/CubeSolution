function newMove = inverse(move)
%inverse 步骤的逆
%   返回步骤的逆
    newMove = move + 2 - 2 * mod(move, 3);
end

