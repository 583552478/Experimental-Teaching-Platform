%ˮ����ά���ƽ���ģ��;����ģ��
clear clc;
clear all;

beta = 72.5;    %������ˮƽ��Ұ�Ƕ�
alpha = 55;     %�������Ĵ�ֱ��Ұ�Ƕ�
da = 10;      %���������л������ĸ߶ȵ�λ��mm��
dp = 5;     % �л������ĺ�ȵ�λ��mm��
dw = 240;       % �������ɼ�����ˮ����ȵ�λ��mm�� % ��10��240��m����25��225��g����38��212��r

na = 1;         %������������
np = 1.49;      %�л�������������
nw = 1.33;      %ˮ��������

d = da+dp+dw;

var_1 = beta/128:(beta/2)/32:beta/2;   %x����
var_2 = alpha/96:(alpha/2)/24:alpha/2; %y����



for i = 0:length(var_1)
    if i < length(var_1)
        i = i + 1;
        
        thetaa(i) = var_1(i);                          %�����е������
        thetap(i) = asind((na/np)*sind(thetaa(i)));    %�л����������
        thetaw(i) = asind((np/nw)*sind(thetap(i)));    %ˮ�������
        dshift_1(i) = (dp*(tand(thetaa(i))-tand(thetap(i)))+dw*(tand(thetaa(i))-tand(thetaw(i))))/tand(thetaw(i))
        
        x0(i) = d * tand(var_1(i));              %var_1(i)�Ƕ�
        x2(i) = da*tand(thetaa(i))+dp*tand(thetap(i))+dw*tand(thetaw(i));
        x1(i) = x2(i);
        temp_z(i) = -1*d + dshift_1(i)/2;
        for j = 0:length(var_2)
            if j < length(var_2)
                j = j + 1;
                thetaa(j) = var_2(j);                          %�����е������
                thetap(j) = asind((na/np)*sind(thetaa(j)));    %�л����������
                thetaw(j) = asind((np/nw)*sind(thetap(j)));
                dshift_2(j) = (dp*(tand(thetaa(j))-tand(thetap(j)))+dw*(tand(thetaa(j))-tand(thetaw(j))))/tand(thetaw(j))
                
                y0(j) = d * tand(var_2(j));
                y2(j) = da*tand(thetaa(j))+dp*tand(thetap(j))+dw*tand(thetaw(j));
                y1(j) = y2(j);
                z0(j) = -1*d;
                z1(j) = temp_z(i) + dshift_2(j)/2;
                z2(j) = z0(j)+2;
                plot3(x0(i),y0(j),z0(j),'b.');
                hold on;
                plot3(x0(i),-1*y0(j),z0(j),'b.');
                hold on;
                plot3(-1*x0(i),y0(j),z0(j),'b.');
                hold on;
                plot3(-1*x0(i),-1*y0(j),z0(j),'b.');
                hold on;
                
                plot3(x1(i),y1(j),z1(j),'r.');
                hold on;
                plot3(x1(i),-1*y1(j),z1(j),'r.');
                hold on;
                plot3(-1*x1(i),y1(j),z1(j),'r.');
                hold on;
                plot3(-1*x1(i),-1*y1(j),z1(j),'r.');
                hold on;
                
                plot3(x2(i),y2(j),z2(j),'g.');
                hold on;
                plot3(x2(i),-1*y2(j),z2(j),'g.');
                hold on;
                plot3(-1*x2(i),y2(j),z2(j),'g.');
                hold on;
                plot3(-1*x2(i),-1*y2(j),z2(j),'g.');
                hold on;
                
            end

        end
        
    end
    
end
hold on;
grid minor;

