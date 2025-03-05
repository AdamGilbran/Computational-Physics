%% Regula-Falsi
% the function is: f(x)=e^x-5
clear,clc

%% Input
f=@(x) exp(x) - 5; % fungsi yang akan dicari akar persamaannya
f0=0;              % Nilai awal fungsi untuk looping

% Looping untuk memeriksa apakah terdapat solusi persamaan di antara dua input yang dimasukkan
while f0 >= 0
    xl=input('xl=');  % Lower input
    xu=input('xu=');  % Upper input
    f0=f(xl)*f(xu);   % Perhitungan syarat bisection
    if f0 >= 0        % Jika nilai syarat bisection > 0, gunakan input lain
        disp('Use another input')
    end
end
er=100;                              % nilai awal error
targetError=input('Target error=');  % batas nilai error relatif yang ditoleransi
maxiter=100;                         % batas iterasi maksimal
xGraph=zeros(maxiter,1);
%% Proses Iterasi
xb=xl;
fprintf('iteration     xl      xu      root        error\n')

for i=1:maxiter
    xr=xu-(f(xu)*(xl-xu))/(f(xl)-f(xu));
    xGraph(i)=xr;
    xl=xr;
    er = abs((xr-xb)/xr)*100;
    xb=xr;
    fprintf('%2d           %4.2f    %4.2f    %6.4f      %6.4f%%\n',i,xl,xu,xr,er)
    if er < targetError
        break
    end
end
