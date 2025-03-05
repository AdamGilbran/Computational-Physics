clear all; clc; close all;
%%Regular Falsi without funciton in this script
%Input

a=0;
b=6;
%x = a:0.1:b;
%fx= x.^3 + x.^2 -8*x - 10;
ET=0.0001;
ER=1;
c0=1;
i=0;
Fa = fungsi(a);
Fb = fungsi(b);
fprintf('==========================================\n')
fprintf('iterasi c ErrorRelatif    interval \n')
fprintf('==========================================\n')
%Algoritm
while ER > ET
    i=i+1;
    %c = (a+b)/2;
    c = b - (Fb*(b-a)/(Fb-Fa));
    Fc = fungsi(c);
    
    if Fa*Fc == 0
        disp('c is solution');
    elseif Fa*Fc<0
        b=c;
    else
        a=c;
    end
    ER = abs((c0-c)/c0);
    c0=c;
    fprintf('%d %f %f (%f; %f)\n',i, c, ER, a, b)
end
%fprintf('%d %f %f (%f; %f)\n',i, c, ER, a, b)

%figure(1)
%plot(x,fx)