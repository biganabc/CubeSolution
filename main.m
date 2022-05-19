clear;clc

result = uint8.empty(0,3,3);

all_pictures = ["front.png","right.png","back.png","left.png","up.png","down.png"];
% 顺序与wzm视频里拍摄的一致，角度就是俯视拍照的角度。先拍前面

n = 4; % 3阶魔方4条线

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
color_map = getColors(I,points,all_colors,n-1);  % 一个3x3的矩阵





result(i,:,:) = color_map;
figure;
daspect([1 1 1])




% 绘图
k = n-1;    % 3 阶魔方
width = 20;  % 色块宽度
for x_n = 1:k  % 坐标轴的x
    for y_n = 1:k  % 坐标轴的y
        % 行优先，从上到下，从左到右遍历。
        rectangle('Position',[(x_n-1)*width,(k-y_n)*width,20,20],'LineWidth',2,...
        'LineStyle','--','EdgeColor','b' ,'facecolor',all_colors(color_map(y_n,x_n),:)/255); 
    end
end
end



for i = 1:6
    result(i,:,:);
end

% 程序运行到这里，保证 result 是 6 x 3 x 3 代表各面各色块的颜色序号。
% all_colors 是 6 x 3 矩阵，对应6种颜色的RGB







