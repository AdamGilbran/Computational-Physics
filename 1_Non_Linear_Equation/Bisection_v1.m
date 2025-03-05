%% Bisection
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
    if f0 > 0        % Jika nilai syarat bisection > 0, gunakan input lain
        disp('Use another input')
    end
end
er=100;                              % nilai awal error
targetError=input('Target error=');  % batas nilai error relatif yang ditoleransi
maxiter=100;                         % batas iterasi maksimal

%% Proses Iterasi
xb=xl;                                            % nilai x 'sebelumnya' untuk menghitung error
fprintf('iteration     xl      xu      root        error\n')   % Header tabel iterasi

for i=1:maxiter              % iterasi dijalankan sebanyak maxiter
    xr=(xl+xu)/2;            % hitung xr
    if f(xl)*f(xr) < 0       % jika syarat < 0, maka ubah nilai xu menjadi xr pada iterasi selanjutnya
        xu=xr;
    elseif f(xl)*f(xr) > 0   % jika syarat > 0, maka ubah nilai xl menjadi xr pada iterasi selanjutnya
        xl=xr;
    else                     % jika syarat = 0, maka xr adalah akar persamaan
        fprintf('The root is %f\n',xr)
        break
    end
    er = abs((xr-xb)/xr)*100;   % hitung nilai error
    xb=xr;                      % definisikan xr sebagai xb untuk iterasi selanjutnya
    fprintf('%2d           %4.2f    %4.2f    %6.4f      %6.4f%%\n',i,xl,xu,xr,er) % tabel iterasi
    if er < targetError
        fprintf('The root is %f\n',xr)
        break
    end
end
