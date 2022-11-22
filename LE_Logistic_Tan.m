clc; clear;
mu = 0:0.01:4; % parameter range
T = 2000;
x = zeros(T,1);

for k = 1:1

x(1) = 0.2;

for j = 1:length(mu)
    y=0; pai=3.17;
    for i=1:T
         
        x(i+1) =mod( mu(j)*x(i)*(1-x(i))+ (1+x(i))*(tan(pai*x(i))),1);
         
        temp=log(abs(mu(j)*(1-2*x(i)))); 
        if (i>50)
            y=y+temp;
        end
    end
    L2(j,k) = y/(T-50);
    
end

end

L = mean(L2,2);
grid
hold on
plot(mu,L,'k','linewidth',2)
plot(mu,zeros(length(mu),1),'k--')
hold off
ylim([-1 1])
xlabel('\mu'),ylabel('L')
title('Lyapunov exponent as functions of \mu')