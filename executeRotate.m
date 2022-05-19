function [Cube1, Cube2] = executeRotate(Cube1, Cube2, instr)

    switch instr
        case 'F'
            s = Cube1.s2;
            ss = Cube2.s2;
            v = [-1 0 0];
            slowRotate(s, ss, v);
            Cube1.s3(:,1) = rot90(s(1,:),3);
            Cube1.s6(1,:) = rot90(s(:,3),3);
            Cube1.s1(:,3) = rot90(s(3,:),3);
            Cube1.s5(3,:) = rot90(s(:,1),3);
            Cube1.s2(:,:) = rot90(s(:,:),3);
            Cube2.s3(:,1) = rot90(ss(1,:),3);
            Cube2.s6(1,:) = rot90(ss(:,3),3);
            Cube2.s1(:,3) = rot90(ss(3,:),3);
            Cube2.s5(3,:) = rot90(ss(:,1),3);
            Cube2.s2(:,:) = rot90(ss(:,:),3);
        case 'B'
            s = Cube1.s4;
            ss = Cube2.s4;
            v = [1 0 0];
            slowRotate(s, ss, v);
            Cube1.s1(:,1) = rot90(s(1,:),3);
            Cube1.s5(1,:) = rot90(s(:,1),1);
            Cube1.s3(:,3) = rot90(s(3,:),3);
            Cube1.s6(3,:) = rot90(s(:,3),1);
            Cube1.s4(:,:) = rot90(s(:,:),3);
            Cube2.s1(:,1) = rot90(ss(1,:),3);
            Cube2.s5(1,:) = rot90(ss(:,1),1);
            Cube2.s3(:,3) = rot90(ss(3,:),3);
            Cube2.s6(3,:) = rot90(ss(:,3),1);
            Cube2.s4(:,:) = rot90(ss(:,:),3);
        case 'L'
            s = Cube1.s1;
            ss = Cube2.s1;
            v = [0 1 0];
            slowRotate(s, ss, v);
            Cube1.s2(:,1) = rot90(s(1,:),3);
            Cube1.s6(:,1) = s(:,3);
            Cube1.s4(:,3) = rot90(s(3,:),3);
            Cube1.s5(:,1) = rot90(s(:,1),2);
            Cube1.s1(:,:) = rot90(s(:,:),3);
            Cube2.s2(:,1) = rot90(ss(1,:),3);
            Cube2.s6(:,1) = ss(:,3);
            Cube2.s4(:,3) = rot90(ss(3,:),3);
            Cube2.s5(:,1) = rot90(ss(:,1),2);
            Cube2.s1(:,:) = rot90(ss(:,:),3);
        case 'R'
            s = Cube1.s3;
            ss = Cube2.s3;
            v = [0 -1 0];
            slowRotate(s, ss, v);
            Cube1.s4(:,1) = rot90(s(1,:),3);
            Cube1.s6(:,3) = rot90(s(:,3),2);
            Cube1.s2(:,3) = rot90(s(3,:),3);
            Cube1.s5(:,3) = s(:,1);
            Cube1.s3(:,:) = rot90(s(:,:),3);
            Cube2.s4(:,1) = rot90(ss(1,:),3);
            Cube2.s6(:,3) = rot90(ss(:,3),2);
            Cube2.s2(:,3) = rot90(ss(3,:),3);
            Cube2.s5(:,3) = ss(:,1);
            Cube2.s3(:,:) = rot90(ss(:,:),3);
        case 'U'
            s = Cube1.s5;
            ss = Cube2.s5;
            v = [0 0 -1];
            slowRotate(s, ss, v);
            Cube1.s3(1,:) = rot90(s(1,:),2);
            Cube1.s2(1,:) = rot90(s(:,3),3);
            Cube1.s1(1,:) = s(3,:);
            Cube1.s4(1,:) = rot90(s(:,1),1);
            Cube1.s5(:,:) = rot90(s(:,:),3);
            Cube2.s3(1,:) = rot90(ss(1,:),2);
            Cube2.s2(1,:) = rot90(ss(:,3),3);
            Cube2.s1(1,:) = ss(3,:);
            Cube2.s4(1,:) = rot90(ss(:,1),1);
            Cube2.s5(:,:) = rot90(ss(:,:),3);
        case 'D'
            s = Cube1.s6;
            ss = Cube2.s6;
            v = [0 0 1];
            slowRotate(s, ss, v);
            Cube1.s3(3,:) = s(1,:);
            Cube1.s4(3,:) = rot90(s(:,3),1);
            Cube1.s1(3,:) = rot90(s(3,:),2);
            Cube1.s2(3,:) = rot90(s(:,1),3);
            Cube1.s6(:,:) = rot90(s(:,:),3);
            Cube2.s3(3,:) = ss(1,:);
            Cube2.s4(3,:) = rot90(ss(:,3),1);
            Cube2.s1(3,:) = rot90(ss(3,:),2);
            Cube2.s2(3,:) = rot90(ss(:,1),3);
            Cube2.s6(:,:) = rot90(ss(:,:),3);
    end    
    
    
    function slowRotate(s, ss, v)
        for i = 1:10
            rotate(s, v, 9);
            rotate(ss, v, 9);
            pause(0.01);
        end
    end    
  
end