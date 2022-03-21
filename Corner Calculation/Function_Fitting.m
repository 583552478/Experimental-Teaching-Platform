clc;
clear all; % ˮ���ӳ���Լ��С��1.61��
[air_num_u] = xlsread('Air_2_u.xls');
[air_num_v] = xlsread('Air_2_v.xls');
[water_num_u] = xlsread('Underwater_2_u.xls');
[water_num_v] = xlsread('Underwater_2_v.xls');

du = air_num_u - water_num_u;
dv = air_num_v - water_num_v;

% polyfit()������Ϸ���
w_a_u = corrcoef(water_num_u,air_num_u); % �������������ϵ��
w_a_u_a = polyfit(water_num_u,air_num_u,2);% ����ֵw_a_u_a�Ƕ���ʽ��ϵ��
% y = 0.8206*x + 183.1986*x^2

w_a_v = corrcoef(water_num_v,air_num_v);
w_a_v_a = polyfit(water_num_v,air_num_v,2);
% y =0.8234*x + 100.7877*x^2

%regress()���Իع�
% for i = 1:size(water_num_u,2)
%     aa(:,i) = regress(air_num_u(:,i),water_num_u(:,i))
% end
% [b,bint,r,rint,stats] = regress(air_num_u(1,:)',water_num_u(1,:)')

% for i = 1:size(water_num_u,2)
%     aa(:,i) = water_num_u(:,i)
% end
% w_a_u_b = regress(water_num_u,air_num_u)


% aa = size(air_num_u,2)

% ˮ�нǵ�
for i = 1:size(water_num_v,1)-1
    water_dv(i,:) = water_num_v(i+1,:)-water_num_v(i,:);% water ˮ��ͼ��ǵ�ÿ���С�֮��ľ���
end
Underwater_average_dv = mean(water_dv(:));

for j=1:size(water_num_u,2)-1
    water_du(:,j) = water_num_u(:,j+1)-water_num_u(:,j); % water ͼ��ǵ㡰�С�֮��ľ���
end
Underwater_average_du = mean(water_du(:));
Underwater_average = (Underwater_average_dv + Underwater_average_du)/2

%�����нǵ�
for i=1:size(air_num_v,1)-1
    air_dv(i,:) = air_num_v(i+1,:)-air_num_v(i,:); % air ͼ��ǵ�ÿ���С�֮��ľ���
end
Air_average_dv = mean(air_dv(:));

for j = 1:size(air_num_u,2)-1
    air_du(:,j) = air_num_u(:,j+1)-air_num_u(:,j);% air ͼ��ǵ�ÿ���С�֮��ľ���
end
Air_average_du = mean(air_du(:));
Air_average = (Air_average_dv + Air_average_du)/2

alpha = Underwater_average/Air_average



% 
% figure(1)
% plot(air_num_u,air_num_v,'.','Color',[1 0 0])
% hold on 
% plot(water_num_u,water_num_v,'.','Color',[0 1 0])
% hold on 
% % plot(du,dv,'.','Color',[0 0 0])

