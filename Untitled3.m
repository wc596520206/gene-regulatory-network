clc
clear
%%  用数值方法搜索吸引子
r = zeros(1,3);
i=1;
eps = 0.01;
for x1 = 0:eps:2
    for x2 = 0:eps:2
        x0 = [x1, x2];
        sys = @(t,x)[1 * x(1)^4/(0.5^4+x(1)^4) + 0.2*0.5^4/(0.5^4+x(2)^4)-1.1*x(1);
        1 * x(2)^4/(0.5^4+x(2)^4) + 0.2*0.5^4/(0.5^4+x(1)^4)-1.1*x(2)];
        [t,xs] =ode45(sys,[0 100],x0);
        temp = norm(abs(x0- xs(end,:)), 2);
        if temp <=eps
            r(i, 1) = x1;
            r(i, 2) = x2;
            r(i, 3) = temp;
            i = i + 1;
        end
    end
end


