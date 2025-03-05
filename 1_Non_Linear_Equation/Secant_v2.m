clear all; clc; close all;
%%Secant without funciton in this script
%Input

x0=0;
x1=1;
%x = a:0.1:b;
%fx= x.^3 + x.^2 -8*x - 10;
fx= @(x) x^2-4*x+4;
ET=0.01;
ER=1;
c0=1;
i=0;
Fx0 = fx(x0);
Fx1 = fx(x1);
fprintf('==========================================\n')
fprintf('iterasi c ErrorRelatif    interval \n')
fprintf('==========================================\n')
%Algoritm
while ER > ET
    i=i+1;
    %c = (a+b)/2;
    %c = b - (Fb*(b-a)/(Fb-Fa));
    x2 = x1-(Fx0*(x1-x0)/(Fx1-Fx0));
    %Fc = fungsi(c);
    %{
    if Fx0*Fx2 == 0
        disp('c is solution');
    elseif Fa*Fc<0
        b=c;
    else
        a=c;
    end
    %}
    ER = abs((x1-x0)/x1)*100;
    x1=x2;
    %fprintf('%d %f %f (%f; %f)\n',i, x2, ER, x0, x1)
end
%fprintf('%d %f %f (%f; %f)\n',i, c, ER, a, b)

%figure(1)
%plot(x,fx)