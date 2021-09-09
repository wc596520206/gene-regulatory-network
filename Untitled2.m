clc
clear
close all
%% 4.2.1.2  �ֲ��ٽ�ֵ������� P73
r = zeros(3,1); % ��Ž��
i = 1;
k0=0; % kֵ
dk = 0.1; % k����
k_max = 5; % k���ֵ
x0 = [0.2, 0.2]; % ��ֵ������
for k=k0: dk: k_max
    % Step4 ���΢�ַ���
    sys = @(t,x)[k * x(1)^4/(0.5^4+x(1)^4) + 0.2*0.5^4/(0.5^4+x(2)^4)-1.1*x(1);
        1 * x(2)^4/(0.5^4+x(2)^4) + 0.2*0.5^4/(0.5^4+x(1)^4)-1.1*x(2)];
    [t,xs] =ode45(sys,[0 100],x0);
    
    % ������
    r(1,i) = k;
    r(2,i) = xs(end, 1);
    r(3,i) = xs(end, 2);
    i = i +1;   
end

%% ��ͼ
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


