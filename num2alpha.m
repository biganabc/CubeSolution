function alpha = num2alpha(number)
alpha = '';
for i = 1:length(number)
    switch number(i)
        case '1'
            ii = 'F';
        case '2'
            ii = 'R';
        case '3'
            ii = 'B';
        case '4'
            ii = 'L';
        case '5'
            ii = 'U';
        case '6'
            ii = 'D';
    end
    alpha = [alpha, ii];
end