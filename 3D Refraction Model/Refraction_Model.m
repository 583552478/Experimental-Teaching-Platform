%水下三维点云矫正模型;完整模型
clear clc;
clear all;

beta = 72.5;    %深度相机水平视野角度
alpha = 55;     %深度相机的垂直视野角度
da = 10;      %深度相机到有机玻璃的高度单位（mm）
dp = 5;     % 有机玻璃的厚度单位（mm）
dw = 240;       % 深度相机采集到的水下深度单位（mm） % （10，240）m；（25，225）g；（38，212）r

na = 1;         %空气中折射率
np = 1.49;      %有机玻璃中折射率
nw = 1.33;      %水中折射率

d = da+dp+dw;

var_1 = beta/128:(beta/2)/32:beta/2;   %x方向
var_2 = alpha/96:(alpha/2)/24:alpha/2; %y方向



for i = 0:length(var_1)
    if i < length(var_1)
        i = i + 1;
        
        thetaa(i) = var_1(i);                          %空气中的入射角
        thetap(i) = asind((na/np)*sind(thetaa(i)));    %有机玻璃入射角
        thetaw(i) = asind((np/nw)*sind(thetap(i)));    %水中入射角
        dshift_1(i) = (dp*(tand(thetaa(i))-tand(thetap(i)))+dw*(tand(thetaa(i))-tand(thetaw(i))))/tand(thetaw(i))
        
        x0(i) = d * tand(var_1(i));              %var_1(i)角度
        x2(i) = da*tand(thetaa(i))+dp*tand(thetap(i))+dw*tand(thetaw(i));
        x1(i) = x2(i);
        temp_z(i) = -1*d + dshift_1(i)/2;
        for j = 0:length(var_2)
            if j < length(var_2)
                j = j + 1;
                thetaa(j) = var_2(j);                          %空气中的入射角
                thetap(j) = asind((na/np)*sind(thetaa(j)));    %有机玻璃入射角
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

