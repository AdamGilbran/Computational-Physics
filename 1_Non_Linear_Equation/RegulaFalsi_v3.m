clear
clc
a=1; b=4; n=1; Er(1)=100;x0=0;
fa=a^2-9;
fb=b^2-9;
if fa*fb > 0                %syarat agar bisa ada solusi : fa*fb<0
    fprintf('fx tidak memiliki solusi')
else                 	   %artinya fa*fb<0
    while Er(n) > 1
        n=n+1;
        x(n)= b -((fb*(b-a)/fb));
        fx=x(n)^2-9;
        if fx*fa < 0
            b=x(n);
        else
            a=x(n);
        end
        if n>1
            Er(n)=abs(x(n)-x0)*100/abs(x(n));
        end
        x0=x(n);
     end
end
x
Er
figure
plot (1:n,Er,'r-');
title('grafik Eror(Er)');
xlabel('Iterasi n');
ylabel('Er');
figure
plot (1:n,x,'g--');
title('grafik solusi persamaan non linier (x)');
xlabel('Iterasi n');
ylabel('x');

