function color_map = getColors(picture,points,all_colors,n)
% 输入图片、魔方阶数、四个顶点坐标、所有候选颜色。输出魔方的数字表示。
% picture 是 imread获得的图片。
% points 是 4 x 2 矩阵。代表4个顶点坐标。顺序：左上，右上，左下，右下。
% 输出一个 n x n 的矩阵，每个位置的数字代表那里的颜色。
% TODO 最好写成通过网格获取颜色的，更稳定。
    left_up_p = squeeze(points(1,:));
    right_up_p = squeeze(points(2,:));
    left_down_p = squeeze(points(3,:));
    right_down_p = squeeze(points(4,:));
    
    up_vector = right_up_p - left_up_p ; % left_up → right_up
    down_vector = right_down_p - left_down_p;  % left_down → right_down
    left_vector = left_down_p - left_up_p;  % left_up → left_down
    right_vector = right_down_p - right_up_p;  % right_up → right_down
    r = 1/(2*n);
    color_map = zeros(n,n);
    up_vector = up_vector * r;
    down_vector = down_vector * r;
    left_vector = left_vector * r;
    right_vector = right_vector * r;
    for i = 1:n
        for j = 1:n
            if i <= n/2 && j <= n/2
                point = left_up_p + (2*j-1)*up_vector + (2*i-1)*left_vector;
            elseif i<=n/2 && j> n/2
                point = right_up_p - (2*(n-j)+1)*up_vector + (2*i-1)*right_vector;
            elseif i>n/2 && j<= n/2
                point = left_down_p + (2*j-1)*down_vector - (2*(n-i)+1)*left_vector;
            else
                point = right_down_p - (2*(n-j)+1)*down_vector - (2*(n-i)+1)*right_vector;
            end
            color_index = readColor(picture,point,all_colors);
            color_map(i,j) = color_index;
        end
    end

    