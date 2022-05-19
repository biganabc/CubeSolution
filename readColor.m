function color_index = readColor(picture,point,all_colors)
    % 利用余弦相似度原理，求图片中某点的颜色序号。
    % picture 是imread()函数得到的图片矩阵。M x N x 3
    % point   是形状为(2,)的数组
    %    point(1)：点所在的行，
    %    point(2)：点所在的列
    % all_colors : 所有候选颜色的RGB。形状为 n x 3 。n是颜色数目
    shape = size(all_colors);
    num_of_colors = shape(1);
    all_colors = uint8(all_colors); % 颜色种类
    all_colors = all_colors';     % 转置
    
    % TODO 最好把那个点和附近的点的RGB平均一下 
    result1 = zeros(1,num_of_colors);
    
    L = 3;  % (3+1+3) x (3+1+3) = 7 x 7 范围内取颜色的平均
    hang = round(point(1));
    lie = round(point(2));
    
    target = picture(hang-L:hang+L,lie-L:lie+L,:);
    size(target);
    m_1 = mean(target,2);
    size(m_1);
    m_2 = mean(m_1,1);
    size(m_2);
    color1 = squeeze(m_2);
    %color1 = squeeze(picture(round(point(1)),round(point(2)),:));
    for i = 1:num_of_colors
        color1 = double(color1);
        color2 = all_colors(:,i);
        color2 = double(color2);
        cosSim = sum(color1.*color2)/sqrt(sum(color1.^2)*sum(color2.^2));
        result1(1,i) = cosSim;
    end
    [~,color_index] = max(result1);
    