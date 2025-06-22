% [y,z] = f(0.05);
% plot(y,'color',[0 0.4470 0.7410])
% hold on
% plot(z,'-b')

function [y,z] = f(k)
%This program is one of the best but not the worst however keep working
    beta=0.02;
    k=0.05;
    a=0;
    b=100;
    N=10000;

    delta_t = (b-a)/N;
    t=a:delta_t:b;
    %initial conditions
    S(1) = 10000;
    I(1)=1;
    R(1) = 0;

    for i = 1:length(t)-1
        S(i+1) = S(i) - delta_t*beta* S(i)*I(i);
        I(i+1) = I(i) + delta_t*beta* S(i)*I(i)-delta_t*k*I(i);
        R(i+1) = R(i) + delta_t*k*I(i);
    end

    plot(t,S,'-r',t,I,'-b',t,R,'-g')
    legend('Susceptible', 'Infected', 'Removed')
    set(gca,'fontsize', 18);
    
    y = S;
    z = I;
end