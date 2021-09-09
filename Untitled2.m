clc
clear
close all
%% 4.2.1.2  分岔临界值仿真计算 P73
r = zeros(3,1); % 存放结果
i = 1;
k0=0; % k值
dk = 0.1; % k增量
k_max = 5; % k最大值
x0 = [0.2, 0.2]; % 初值吸引子
for k=k0: dk: k_max
    % Step4 求解微分方程
    sys = @(t,x)[k * x(1)^4/(0.5^4+x(1)^4) + 0.2*0.5^4/(0.5^4+x(2)^4)-1.1*x(1);
        1 * x(2)^4/(0.5^4+x(2)^4) + 0.2*0.5^4/(0.5^4+x(1)^4)-1.1*x(2)];
    [t,xs] =ode45(sys,[0 100],x0);
    
    % 保存结果
    r(1,i) = k;
    r(2,i) = xs(end, 1);
    r(3,i) = xs(end, 2);
    i = i +1;   
end

%% 绘图
figure
plot(r(1,:), r(2,:),'r', r(1,:),r(3,:),'b')
legend('x1','x2')
axis([-1 5 -1  5])
fsize=15;
set(gca,'XTick',-1:1:5,'FontSize',fsize)
set(gca,'YTick',-1:1:5,'FontSize',fsize) 
xlabel('a1','FontSize',fsize) 
ylabel('x','FontSize',fsize) 
grid on


