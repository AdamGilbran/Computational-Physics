% Misal kita punya bentuk persamaan diferensial sbb:
% dy/dx= -xy 
% Solusi dari persamaan diferensial adalah y sbg fungsi x [ y(x) ]
% Dengan metode analitik, solusi dari persamaan diferensial di atas dapat
% diperoleh dengan mengintergralkan persamaan tersebut

% Untuk metode numerik, terdapat beberapa metode yang dapat digunakan untuk
% mendapatkan solusi persamaan diferensial:
% 1. Dengan deret Taylor
% 2. Dengan metode Euler
% 3. Metode Runge-Kutta

% Ketiga metode tersebut memiliki prinsip yang sama, yaitu melakukan proses
% iterasi untuk memperoleh nilai y di titik selanjutnya berdasarkan nilai
% x dan y di titik sebelumnya, kemudian nilai-nilai x & y yang telah
% diperoleh akan diplot pada grafik hingga membentuk suatu kurva

% Pada persamaan sebelumnya, untuk memperoleh solusi PD kita memerlukan
% suatu koordinat awal sebagai titik permulaan. Misal x0 = -3; y0 = 0.
%    i   |   x   |   y   
% -----------------------
%    0   |  -3   |   0   
%    1   | x0+h  |  ...
%    2   | x1+h  |  ...
%    3   | x2+h  |  ...
%   dst  |  ...  |  ...
%% ==============================Deret Taylor==============================
% Persamaan deret Taylor:
% y(x_setelah) = y(x_sebelum) + h * y'(x_sebelum) + h^2/2 + y''(x_sblm) ...
% dy/dx + x*y = 0
% dy/dx = y'(x) = -x*y
% z = u v, u = -x & v = y
% z'= u'v + uv'
% y''(x) = -y + (-x)((-x)*y) = -y + x^2*y
clear,clc
df=@(x,y) -x*y;
df2=@(x,y) -y + y*x^2;

% Input
a = 0;   % batas bawah interval
b = 3;    % batas atas interval
h = 0.3;  % step
y = 1;
N = round((b-a)/h);   %jumlah iterasi
xx=zeros(N,1);
yy=zeros(N,1);

for i = 1:N % Loop untuk melakukan integrasi numerik
    x = a+i*h;
    y = y + df(x,y)*h + df2(x,y)*(h^2)/2;
    %fprintf('%.4f    %.4f \n',x,y)
    yy(i) = y; % Menyimpan nilai y pada setiap iterasi
    xx(i) = a + i*h; % Menyimpan nilai x pada setiap iterasi
end

figure;
plot(xx, yy, 'b--'); % Membuat plot solusi numerik
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y

%% ==============================Metode Euler==============================
% Persamaan metode Euler ≈ deret Taylor
% y(x_setelah) = y(x_sebelum) + h * f(x_sebelum,y_sebelum)
% dy/dx + x*y = 0
% dy/dx = y'(x) = -x*y

clear,clc
f=@(x,y) -x*y;

% Input
a = 0;   % batas bawah interval
b = 3;    % batas atas interval
h = 0.3;  % step
y = 1;
N = round((b-a)/h);   % jumlah iterasi
xx=zeros(N,1);
yy=zeros(N,1);

for i = 1:N % Loop untuk melakukan integrasi numerik
    x = a+i*h;
    y = y + h*f(x,y);
    fprintf('%.4f    %.4f \n',x,y)
    yy(i) = y; % Menyimpan nilai y pada setiap iterasi
    xx(i) = x; % Menyimpan nilai x pada setiap iterasi
end
figure(2)
plot(xx, yy, 'r--'); % Membuat plot solusi numerik
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y

%% ==============================Runge-Kutta===============================
% Metode orde Runge-Kutta memiliki orde:
% 1. Orde 1: y(x_[i+1]) = y(x_i) + k1
%    dengan k1 = h*f(x_i, y_i)
%    Runge-Kutta orde 1 = Metode Euler
%
% 2. Orde 2: y(x_[i+1]) = y(x_i) + (1/2)*(k1+k2)
%    dengan k1 = h*f(x_i,y_sblm)
%           k2 = h*f(x_i + h, y_i + k1)
%
% 3. Orde 3: y(x_[i+1]) = y(x_i) + (1/6)*(k1 + 4*k2 + k3)
%    dengan k1 = h*f(x_i,y_i)
%           k2 = h*f(x_i + h/2, y_i + k1/2)
%           k3 = h*f(x_i + h, y_i - k1 + 2*k2)
%
% 4. Orde 4: y(x_[i+1]) = y_i + (k1 + 2*k2 + 2*k3 + k4)
%    dengan k1 = h*f(x_i,y_i)
%           k2 = h*f(x_i + h/2, y_i + k1/2)
%           k3 = h*f(x_i + h/2, y_i + k2/2)
%           k4 = h*f(x_i + h, y_i + k3)

%% ============================== RK Orde 1 ===============================
% dy/dx + x*y = 0
% dy/dx = y'(x) = -x*y

clear,clc
f=@(x,y) -x*y;

% Input
a = 0;   % batas bawah interval
b = 3;    % batas atas interval
h = 0.3;  % step
y = 1;
N = round((b-a)/h);   % jumlah iterasi
xx=zeros(N,1);
yy=zeros(N,1);

for i = 1:N % Loop untuk melakukan integrasi numerik
    x = a+i*h;
    k1 = h*f(x,y);
    y = y + k1;
    fprintf('%.4f    %.4f \n',x,y)
    yy(i) = y; % Menyimpan nilai y pada setiap iterasi
    xx(i) = x; % Menyimpan nilai x pada setiap iterasi
end
figure(3)
plot(xx, yy, 'r--'); % Membuat plot solusi numerik
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y

%% ============================== RK Orde 2 ===============================
% dy/dx + x*y = 0
% dy/dx = y'(x) = -x*y

clear,clc
f=@(x,y) -x*y;

% Input
a = 0;   % batas bawah interval
b = 3;    % batas atas interval
h = 0.3;  % step
y = 1;
N = round((b-a)/h);   % jumlah iterasi
xx=zeros(N,1);
yy=zeros(N,1);

for i = 1:N % Loop untuk melakukan integrasi numerik
    x = a+i*h;
    k1 = h*f(x,y);
    k2 = h*f(x + h, y +k1);
    y = y + (1/2)*(k1 + k2);
    fprintf('%.4f    %.4f \n',x,y)
    yy(i) = y; % Menyimpan nilai y pada setiap iterasi
    xx(i) = x; % Menyimpan nilai x pada setiap iterasi
end
figure(4)
plot(xx, yy, 'r--'); % Membuat plot solusi numerik
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y

%% ============================== RK Orde 3 ===============================
% dy/dx + x*y = 0
% dy/dx = y'(x) = -x*y

clear,clc
f=@(x,y) -x*y;


% Input
a = 0;   % batas bawah interval
b = 3;    % batas atas interval
h = 0.3;  % step
y = 1;
N = round((b-a)/h);   % jumlah iterasi
xx=zeros(N,1);
yy=zeros(N,1);

for i = 1:N % Loop untuk melakukan integrasi numerik
    x = a+i*h;
    k1 = h*f(x,y);
    k2 = h*f(x + 0.5*h, y + 0.5*k1);
    k3 = h*f(x + h, y - k1 + 2*k2);
    y = y + (1/6)*(k1 + 4*k2 + k3);
    fprintf('%.4f    %.4f \n',x,y)
    yy(i) = y; % Menyimpan nilai y pada setiap iterasi
    xx(i) = x; % Menyimpan nilai x pada setiap iterasi
end
figure(5)
plot(xx, yy, 'r--'); % Membuat plot solusi numerik
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y

%% ============================== RK Orde 4 ===============================
clear,clc
f=@(x,y) -x*y;

% Input
a = 0;   % batas bawah interval
b = 3;    % batas atas interval
h = 0.3;  % step
y = 1;
N = round((b-a)/h);   % jumlah iterasi
xx=zeros(N,1);
yy=zeros(N,1);

for i = 1:N % Loop untuk melakukan integrasi numerik
    x = a+i*h;
    k1 = h*f(x,y);
    k2 = h*f(x + 0.5*h, y + 0.5*k1);
    k3 = h*f(x + 0.5*h, y + 0.5*k2);
    k4 = h*f(x + h, y + k3);
    y = y + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    fprintf('%.4f    %.4f \n',x,y)
    yy(i) = y; % Menyimpan nilai y pada setiap iterasi
    xx(i) = x; % Menyimpan nilai x pada setiap iterasi
end
figure(6)
plot(xx, yy, 'r--'); % Membuat plot solusi numerik
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y

%% Plot All Method
df=@(x,y) -x*y;
df2=@(x,y) -y + y*x^2;
yy_taylor = zeros(N,1);
yy_euler = zeros(N,1);
yy_runge = zeros(N,1);
yy_eksak = zeros(N,1);
fungsi_eksak = @(x) exp(-x^2/2);


%Hitung
y = 1;
for i = 1:N % Loop untuk melakukan integrasi numerik
    x = a+i*h;
    y_taylor = y + df(x,y)*h + df2(x,y)*(h^2)/2;
    yy_taylor(i) = y; % Menyimpan nilai y pada setiap iterasi
    y_euler = y + h*f(x,y);
    yy_euler(i) = y_euler;
    k1 = h*f(x,y);
    k2 = h*f(x + 0.5*h, y + 0.5*k1);
    k3 = h*f(x + h, y - k1 + 2*k2);
    y_runge = y + (1/6)*(k1 + 4*k2 + k3);
    yy_runge(i) = y_runge;
    y_eksak = fungsi_eksak(x);
    yy_eksak(i) = y_eksak;
    xx(i) = x; % Menyimpan nilai x pada setiap iterasi
end

figure;
hold on;
title('Grafik Solusi Persamaan Diferensial dy/dx = -xy'); % judul plot
xlabel('x'); % Menambahkan label sumbu x
ylabel('y'); % Menambahkan label sumbu y

% Persamaan deret Taylor:
plot(xx, yy_taylor, 'r--', 'DisplayName','Taylor'); % Membuat plot solusi numerik

% Persamaan Euler:
plot(xx, yy_euler, 'b--','DisplayName','Euler'); % Membuat plot solusi numerik

% Persamaan Runge Kutta Orde 4:
plot(xx, yy_runge, 'k--', 'DisplayName','Runge'); % Membuat plot solusi numerik

% Solusi Eksak:
plot(xx, yy_eksak, 'g--','DisplayName','Eksak'); % Membuat plot solusi numerik

legend('Location','best');
grid on;
hold off;

%% solusi exact
f = @(x,y) exp^((x^2)/2);
xx_ex= linspace(0,3,0.3);
figure(8);


