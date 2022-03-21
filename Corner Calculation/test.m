clc;
clear all;

[air_num_u] = xlsread('u.xls');
[air_num_v] = xlsread('v.xls');
uu = (fliplr(air_num_u))';
vv = (fliplr(air_num_v))';

xlswrite('air_num_u.xls',uu);
xlswrite('air_num_v.xls',vv);