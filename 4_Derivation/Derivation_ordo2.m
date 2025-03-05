%% Perbandingan Turunan Numerik Orde Dua
% Buat Fungsi
fx = @(x) 10*x.^5 + 18*x.^4 + 28*x.^3 + 7*x.^2 + 6;

% Inisialisasi Parameter
x0 = 3; % Titik di mana turunan dievaluasi
eksak = 7862; % Nilai turunan eksak di titik x0
h = 0.1; % Langkah increment

% Hampiran Selisih Terpusat
diff_terpusat = (fx(x0 + h) - 2*fx(x0) + fx(x0 - h)) / (h.^2);
error_terpusat = abs((diff_terpusat - eksak)/eksak) * 100;

% Hampiran Selisih Maju
diff_maju = (fx(x0 + 2*h) - 2*fx(x0 + h) + fx(x0)) / (h.^2);
error_maju = abs((diff_maju - eksak)/eksak) * 100;

% Hampiran Selisih Mundur
diff_mundur = (fx(x0 - 2*h) - 2*fx(x0 - h) + fx(x0)) / (h.^2);
error_mundur = abs((diff_mundur - eksak)/eksak) * 100;

%Buat Tabel
fprintf('----------------------------------------------------------------------------\n');
fprintf(' Metode                 h            Hasil          Error\n');
fprintf('----------------------------------------------------------------------------\n');
fprintf(' Selisih Terpusat   %7.2f %15.2f %12.2f%%\n', h, diff_terpusat, error_terpusat);
fprintf(' Selisih Maju       %7.2f %15.2f %12.2f%%\n', h, diff_maju, error_maju);
fprintf(' Selisih Mundur     %7.2f %15.2f %12.2f%%\n', h, diff_mundur, error_mundur);
fprintf('----------------------------------------------------------------------------\n');
