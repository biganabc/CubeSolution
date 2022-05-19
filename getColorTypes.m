function all_colors=getColorTypes(name_list)
% name_list ��ͼƬ���Ƶ����飬��״Ӧ����1x6
all_colors = zeros(6,3);

n = 4; % 3��ħ��4����
L = 15;  % (3+1+3) x (3+1+3) = 7 x 7 ��Χ��ȡ��ɫ��ƽ��
for i= 1:6
    image = imread(name_list(i));
    linePoints = getBorder(image);
    points = [
    [squeeze(linePoints(1,4)),squeeze(linePoints(1,3))];
    [squeeze(linePoints(n,4)),squeeze(linePoints(n,3))];
    [squeeze(linePoints(1,2)),squeeze(linePoints(1,1))];
    [squeeze(linePoints(n,2)),squeeze(linePoints(n,1))]];
    center = mean(points,1);
    point = center;
    hang = round(point(1));
    lie = round(point(2));
    target = image(hang-L:hang+L,lie-L:lie+L,:);
    size(target);
    m_1 = median(target,2);
    m_2 = median(m_1,1);
    color1 = squeeze(m_2);
    all_colors(i,:) = color1;
    
    
end
end