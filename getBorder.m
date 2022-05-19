function linePoints = getBorder(I)
debug = 0;
I = rgb2gray(I);

if (debug)
figure;
subplot(1,3,1);
imshow(I,[]);
end

BW = takeColorXYP(I);   % 提取黑色点

[H,T,R] = hough(BW,'RhoResolution',1.0,'Theta',-20:1:20);%计算二值图像的标准霍夫变换，H为霍夫变换矩阵，I,R为计算霍夫变换的角度和半径值

if (debug)
subplot(1,3,2);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');%hough变换的图像
xlabel('\theta'), ylabel('\rho');
axis on,axis square,hold on;
end


P  = houghpeaks(H,40,'threshold',0.7*max(H(:)));%提取3个极值点
x = T(P(:,2)); 
y = R(P(:,1));

if (debug)
plot(x,y,'s','color','white');%标出极值点
end

lines=houghlines(BW,T,R,P);%提取线段

if (debug)
subplot(1,3,3);
imshow(I), hold on;
end

size(lines); % 1 x num
Y = zeros(1,length(lines)*(length(lines)-1)/2);

mark = 1;

for i = 1:length(lines)-1
    start_1 = lines(i).point1;
    end_1 = lines(i).point2;
    middle_1 = (start_1+end_1)/2;
    A1 = end_1(2) - start_1(2);
    B1 = start_1(1) - end_1(1);
    C1 = start_1(2)*end_1(1) - start_1(1)*end_1(2);
    % Ax + By + C = 0
    for j=i+1:length(lines)
        start_2 = lines(j).point1;
        end_2 = lines(j).point2;
        middle_2 = (start_2+end_2)/2;
        A2 = end_2(2) - start_2(2);
        B2 = start_2(1) - end_2(1);
        C2 = start_2(2)*end_2(1) - start_2(1)*end_2(2);
        
        d_m1_m2 = sqrt(middle_1.*middle_2);  
        d_m1_l2 = (A2*middle_1(1)+B2*middle_1(2)+C2)/sqrt(A2*A2+B2*B2);
        d_l1_m2 = (A1*middle_2(1)+B1*middle_2(2)+C1)/sqrt(A1*A1+B1*B1);
        d_s1_l2 = (A2*start_1(1)+B2*start_1(2)+C2)/sqrt(A2*A2+B2*B2);
        d_l1_s2 = (A1*start_2(1)+B1*start_2(2)+C1)/sqrt(A1*A1+B1*B1);
        d_e1_l2 = (A2*end_1(1)+B2*end_1(2)+C2)/sqrt(A2*A2+B2*B2);
        d_l1_e2 = (A1*end_2(1)+B1*end_2(2)+C1)/sqrt(A1*A1+B1*B1);
        d_i_j = min(abs([d_m1_m2,d_m1_l2,d_l1_m2,d_s1_l2,d_l1_s2,d_e1_l2,d_l1_e2]));
        Y(mark) = d_i_j;
        mark = mark + 1;
    end
end




Z=linkage(Y,'single');
n = 4;  % 3阶魔方4条边
T=cluster(Z,'maxclust',n);  % 聚类的结果
points = zeros(n,2*2);  % 每条边上两个点，每个点有XY 。
% start_x,start_y,end_x,end_y  .
% start 在上面，它的y尽量大

for i = 1:n
    sub_lines = lines(T==i);  % 本组的所有直线
    points(i,1) = sub_lines(1).point1(1);
    points(i,2) = sub_lines(1).point1(2);
    points(i,3) = sub_lines(1).point1(1);
    points(i,4) = sub_lines(1).point1(2);
    
    for index = 1:length(sub_lines)  
        % 不关心这些点到底在哪个直线上,也不关心这些点哪个是开头哪个是结尾
        start_ = sub_lines(index).point1;  
        end_ = sub_lines(index).point2;
        if (start_(2) > points(i,2))
            points(i,1) = start_(1);
            points(i,2) = start_(2);
        end
        if (end_(2) > points(i,2))
            points(i,1) = end_(1);
            points(i,2) = end_(2);
        end
        if(start_(2) < points(i,4))
            points(i,3) = start_(1);
            points(i,4) = start_(2);
        end
        if(end_(2) < points(i,4))
            points(i,3) = end_(1);
            points(i,4) = end_(2);
        end
    end
end

points = sortrows(points);  % 矩阵各行从上到下，对应直线从左到右。

linePoints = points;
if (debug)
for k = 1:length(lines)
xy = [lines(k).point1; lines(k).point2];

plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');%画出线段
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');%起点
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');%终点
end
end