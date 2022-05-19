clear;clc

result = uint8.empty(0,3,3);

all_pictures = ["front.png","right.png","back.png","left.png","up.png","down.png"];
% ˳����wzm��Ƶ�������һ�£��ǶȾ��Ǹ������յĽǶȡ�����ǰ��

n = 4; % 3��ħ��4����

all_colors=getColorTypes(all_pictures);

for color_index=1:6
    mayBeWhite = all_colors(color_index,:);
    if ( mayBeWhite(1) > 130 && mayBeWhite(2) > 130 && mayBeWhite(3) > 130)
        all_colors(color_index,:) = [250,250,250];
    end
end



for i = 1:6
I = imread(all_pictures(i));
linePoints = getBorder(I);

points = [
    [squeeze(linePoints(1,4)),squeeze(linePoints(1,3))];
    [squeeze(linePoints(n,4)),squeeze(linePoints(n,3))];
    [squeeze(linePoints(1,2)),squeeze(linePoints(1,1))];
    [squeeze(linePoints(n,2)),squeeze(linePoints(n,1))]];
color_map = getColors(I,points,all_colors,n-1);  % һ��3x3�ľ���





result(i,:,:) = color_map;
figure;
daspect([1 1 1])




% ��ͼ
k = n-1;    % 3 ��ħ��
width = 20;  % ɫ����
for x_n = 1:k  % �������x
    for y_n = 1:k  % �������y
        % �����ȣ����ϵ��£������ұ�����
        rectangle('Position',[(x_n-1)*width,(k-y_n)*width,20,20],'LineWidth',2,...
        'LineStyle','--','EdgeColor','b' ,'facecolor',all_colors(color_map(y_n,x_n),:)/255); 
    end
end
end



for i = 1:6
    result(i,:,:);
end

% �������е������֤ result �� 6 x 3 x 3 ��������ɫ�����ɫ��š�
% all_colors �� 6 x 3 ���󣬶�Ӧ6����ɫ��RGB







