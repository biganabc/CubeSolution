function instrs = solution2str(solution)
%solution = ["D2", "F3", "U1"];
instrs = '';
char_sulotion = char(solution);
for i = 1:length(solution)
    operation = char_sulotion(:,:,i);
    alpha = operation(1);
    switch operation(2)
        case '1'
            ii = alpha;
        case '2'
            ii = [alpha, alpha];
        case '3'
            ii = [alpha, alpha, alpha];
    end
    instrs = [instrs, ii];
end