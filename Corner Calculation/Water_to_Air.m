clc;
clear all;%拟合函数关系的转化

[air_num_u] = xlsread('Air_1_u.xls');
[air_num_v] = xlsread('Air_1_v.xls');
[water_num_u] = xlsread('Underwater_1_u.xls');
[water_num_v] = xlsread('Underwater_1_v.xls');

air_num_u_r =  0.8206*water_num_u + 183.1986*water_num_u.^2;
air_num_v_r = 0.8234*water_num_v + 100.7877*water_num_v.^2;
xlswrite('air_num_u.xls',air_num_u);
xlswrite('air_num_v.xls',air_num_v);

du = air_num_u - air_num_u_r;
dv = air_num_v - air_num_v_r;

xlswrite('du.xls',du);
xlswrite('dv.xls',dv);

