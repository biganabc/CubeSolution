function bool = isMoveApplicable(move,phase)
%isMoveApplicable 此步在该阶段是否可执行
%   无
    applicableMoves = uint32([ 262143, 259263, 74943, 74898 ]);
    % applicableMoves[phase] & (1 << move)
    bool = ( bitand(applicableMoves(phase), bitshift(uint32(1), move)) ~= 0);
end

