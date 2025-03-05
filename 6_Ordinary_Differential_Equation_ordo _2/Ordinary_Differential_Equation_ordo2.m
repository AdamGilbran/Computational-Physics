%% Runge Kutta Orde 4
f=@(t,x,v) v;% v = dx/dt
g=@(t,x,v) -(2/10)*x -(3/10)*v;

a =0;   
b =50;    
h =0.1;  
x= 10;
v = 0;
num = round((b-a)/h);   
tt_rk=zeros(num,1);xx_rk=tt_rk;vv_rk=tt_rk;
for i = 1:num 
    t  = a+i*h;
    p1 = h*f(t,x, v);
    q1 = h*g(t,x, v);
    p2 = h*f(t + 0.5*h, x + 0.5*p1, v + 0.5*q1);
    q2 = h*g(t + 0.5*h, x + 0.5*p1, v + 0.5*q1);
    p3 = h*f(t + 0.5*h, x + 0.5*p2,  v + 0.5*q2);
    q3 = h*g(t + 0.5*h, x + 0.5*p2,  v + 0.5*q2);
    p4 = h*f(t+h, x+p3, v+q3);
    q4 = h*g(t+h, x+p3, v+q3);
    x = x + (1/6)*(p1 + 2*p2 + 2*p3 + p4);
    fprintf('%.4f    %.4f \n',t,x)  
    v = v + (1/6)*(q1 + 2*q2 + 2*q3 + q4);
    fprintf('%.4f    %.4f \n',t,v)
    vv_rk(i) = v; % Menyimpan nilai y pada setiap iterasi
    xx_rk(i) = x; % Menyimpan nilai y pada setiap iterasi
    tt_rk(i) = t; % Menyimpan nilai x pada setiap iterasi
end
%% 
figure(1)
hold on
plot(tt, xx, 'r--');
plot(tt, vv, 'b--'); %
title(''); 
%% ============================== RK Orde 4 ===============================

f=@(z) z;
g=@(y,z) - 2*y - 3*z;

% Input
a = 0;   % batas bawah interval
b = 20;    % batas atas interval
h = 0.01;  % step
% x0=0;y0=0;z0=0;
y=0;z=10;
Num=round(abs((b-a)/h));
for i = 1:Num % Loop untuk melakukan integrasi numerik
    x  = a+i*h;
    p1 = h*f(x,y,z);     % k1
    q1 = h*g(x,y,z);     % l1
    p2 = h*f(x+0.5*h,y+0.5*p1,z+0.5*q1);     % k2
    q2 = h*g(x+0.5*h,y+0.5*p1,z+0.5*q1);     % l2
    p3 = h*f(x+0.5*h,y+0.5*p2,z+0.5*q2);     % k3 
    q3 = h*g(x+0.5*h,y+0.5*p2,z+0.5*q2);     % l3
    p4 = h*f(x+h,y+p3,z+q3);     % k4
    q4 = h*g(x+h,y+p3,z+q3);     % l4
    y = y + (1/6)*(p1 + 2*p2 + 2*p3 + p4);
    z = z + (1/6)*(q1 + 2*q2 + 2*q3 + q4);
    %fprintf('%.4f    %.4f \n',x,y)
    yy(i) = y; % Menyimpan nilai y pada setiap iterasi
    zz(i) = z;
    xx(i) = x; % Menyimpan nilai x pada setiap iterasi
end

figure
hold on
plot(xx, yy, 'm--'); % Membuat plot solusi numerik
plot(xx,zz,'b--')
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy; RK orde 4'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y
xlim([0 20])

%% Euler
%f=@(t,x,v) v;
%g =@(t,x,v) -(2/10)*x -(3/10)*v;

% Input
a = 0;   % batas bawah interval
b = 50;    % batas atas interval
h = 0.001;  % step
x = 10; 
v=0;
N=round(abs((b-a)/h)) ;   % jumlah iterasi
tt_e=zeros(N,1);
xx_e=zeros(N,1);
vv_e=zeros(N,1);

for i = 1:N % Loop untuk melakukan integrasi numerik
    t = a+i*h;
    x = x + h*f(t,x,v);
    v = v + h*g(t,x,v);
    fprintf('%.4f    %.4f %.4f\n' ,t, x, v)
    tt_e(i) = t; % Menyimpan nilai y pada setiap iterasi
    xx_e(i) = x; % Menyimpan nilai x pada setiap iterasi
    vv_e(i) = v;
end
%%
figure(1)
hold on
plot(tt_e, xx_e, 'r--'); % Membuat plot solusi numerik
plot(tt_rk, xx_rk, 'b--');
title('Grafik posisi Persamaan Diferensial ordo2'); % judul plot
xlabel('t'); % Menambahkan label sumbu x
ylabel('x'); % Menambahkan label sumbu y

figure(2)
hold on
plot(tt_e, vv_e, 'r--'); % Membuat plot solusi numerik
plot(tt_rk, vv_rk, 'b--');
title('Grafik kecepatan Persamaan Diferensial ordo2'); % judul plot
xlabel('t'); % Menambahkan label sumbu x
ylabel('v'); % Menambahkan label sumbu y