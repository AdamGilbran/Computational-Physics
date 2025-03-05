%% Orde Tiga dan Orde Empat dengan Hampiran Selisih Terpusat
% Buat Fungsi
fx = @(x) 10*x.^5 + 18*x.^4 + 28*x.^3 + 7*x.^2 + 6;

% Inisialisasi Parameter
x0 = 3; % Titik di mana turunan dievaluasi
eksak_orde_tiga = 6864; % Nilai turunan eksak di titik x0 pada orde 3
eksak_orde_empat = 4032; % Nilai turunan eksak di titik x0 pada orde 4
h = 0.1; % Langkah increment

%Orde Tiga
diff_orde_tiga = (fx(x0 + 2*h) - 2 * fx(x0 + h) + 2 * fx(x0 - h) - fx(x0 - 2*h)) / (2*h^3);
error_orde_tiga = abs((diff_orde_tiga - eksak_orde_tiga)/eksak_orde_tiga) * 100;

%Orde Empat
diff_orde_empat = (fx(x0 - 2 * h) - 4 * fx(x0 - h) + 6 * fx(x0) - 4 * fx(x0 + h) + fx(x0 + 2 * h)) / (h^4);
error_orde_empat = abs((diff_orde_empat - eksak_orde_empat)/eksak_orde_empat) * 100;

%Buat Tabel
fprintf('----------------------------------------------------------------------------\n');
fprintf(' Orde               h            Hasil         Error\n');
fprintf('----------------------------------------------------------------------------\n');
fprintf(' Orde Tiga      %7.2f %15.2f %12.4f%%\n', h, diff_orde_tiga, error_orde_tiga);
fprintf(' Orde Empat     %7.2f %15.2f %12.4f%%\n', h, diff_orde_empat, error_orde_empat);
fprintf('----------------------------------------------------------------------------\n');
