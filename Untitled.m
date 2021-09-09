clc
clear
close all
%% 4.2.1.1 ÎüÒý×ÓËÑÑ°  Í¼4.2 
[x1,x2] = meshgrid(0:0.1:2, 0:0.1:2);

u = x1.^4 ./ (0.5^4 + x1.^4) + 0.2 *0.5^4 ./ (0.5^4 + x2.^4) - 1.1*x1;
v = x2.^4 ./ (0.5^4 + x2.^4) + 0.2 *0.5^4 ./ (0.5^4 + x1.^4) - 1.1*x2;

figure
hold on
streamslice(x1,x2,u,v)
grid on