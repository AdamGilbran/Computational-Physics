%% Inisialisasi Fungsi dan Parameter
% Buat Fungsi
fx = @(x) 10 * x^5 + 18 * x^4 + 28 * x^3 + 7 * x^2 + 6;

% Inisialisasi Parameter
x0 = 3; % Titik di mana turunan dievaluasi
eksak = 6792; % Nilai turunan eksak di titik x0
nilai_h = 0; % Nilai awal untuk h
delta_h = 0.1; % Increment yang ditambahkan pada nilai h pada setiap iterasi
num_iter = 10; % Jumlah iterasi

%% Hampiran Selisih Terpusat
fprintf('Hampiran Selisih Terpusat\n');

% Membuat array untuk menyimpan nilai h, hasil turunan, dan error dari selisih terpusat
h_terpusat = zeros(1, num_iter);
hasil_turunan_terpusat = zeros(1, num_iter);
error_terpusat = zeros(1, num_iter);

% Menghitung nilai turunan dan error untuk variasi nilai h yang ditambah delta_h
for i = 1:num_iter
    h_terpusat(i) = nilai_h + i * delta_h;
    diff = (fx(x0 + h_terpusat(i)) - fx(x0 - h_terpusat(i))) / (2 * h_terpusat(i));
    error_terpusat(i) = abs((diff - eksak) / eksak) * 100;
    hasil_turunan_terpusat(i) = diff;
end

% Menampilkan tabel hasil hampiran selisih terpusat
fprintf('--------------------------------------------------------------\n');
fprintf('   h           Nilai Turunan            Error\n');
fprintf('--------------------------------------------------------------\n');
for i = 1:num_iter
    fprintf('%10.6f   %15.6f   %15.6f\n', h_terpusat(i), hasil_turunan_terpusat(i), error_terpusat(i));
end
fprintf('--------------------------------------------------------------\n');

% Tampilkan grafik nilai turunan hampiran selisih terpusat
figure; % Membuat figure baru
plot(h_terpusat, hasil_turunan_terpusat, 'b-'); % Plot nilai turunan
title('Hampiran Selisih Terpusat Orde 1 - Nilai Turunan Numerik'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Nilai Turunan'); % Label sumbu y
grid on; % Menampilkan grid

% Tampilkan grafik error hampiran selisih terpusat
figure; % Membuat figure baru
plot(h_terpusat, error_terpusat, 'r--'); % Plot nilai turunan
title('Hampiran Selisih Terpusat Orde 1 - Grafik Error'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Error'); % Label sumbu y
grid on; % Menampilkan grid

%% Hampiran Selisih Maju
fprintf('Hampiran Selisih Maju\n');

% Membuat array untuk menyimpan nilai h, hasil turunan, dan error dari selisih maju
h_maju = zeros(1, num_iter);
hasil_turunan_maju = zeros(1, num_iter);
error_maju = zeros(1, num_iter);

% Menghitung nilai turunan dan error untuk variasi nilai h yang ditambah delta_h
for i = 1:num_iter
    h_maju(i) = nilai_h + i * delta_h;
    diff = (fx(x0 + h_maju(i)) - fx(x0)) / h_maju(i);
    error_maju(i) = abs((diff - eksak) / eksak) * 100;
    hasil_turunan_maju(i) = diff;
end

% Menampilkan tabel hasil hampiran selisih maju
fprintf('--------------------------------------------------------------\n');
fprintf('   h           Nilai Turunan            Error\n');
fprintf('--------------------------------------------------------------\n');
for i = 1:num_iter
    fprintf('%10.6f   %15.6f   %15.6f\n', h_maju(i), hasil_turunan_maju(i), error_maju(i));
end
fprintf('--------------------------------------------------------------\n');

% Tampilkan grafik nilai turunan hampiran selisih maju
figure; % Membuat figure baru
plot(h_maju, hasil_turunan_maju, 'b-'); % Plot nilai turunan dari metode hampiran selisih maju
title('Hampiran Selisih Maju Orde 1 - Nilai Turunan Numerik'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Nilai Turunan'); % Label sumbu y
grid on; % Menampilkan grid

% Tampilkan grafik error hampiran selisih maju
figure; % Membuat figure baru
plot(h_maju, error_maju, 'r--'); % Plot error dari metode hampiran selisih maju
title('Hampiran Selisih Maju Orde 1 - Grafik Error'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Error'); % Label sumbu y
grid on; % Menampilkan grid

%% Hampiran Selisih Mundur
fprintf('Hampiran Selisih Mundur\n');

% Membuat array untuk menyimpan nilai h, hasil turunan, dan error dari selisih terpusat
h_mundur = zeros(1, num_iter);
hasil_turunan_mundur = zeros(1, num_iter);
error_mundur = zeros(1, num_iter);

% Menghitung nilai turunan dan error untuk variasi nilai h yang ditambah delta_h
for i = 1:num_iter
    h_mundur(i) = nilai_h + i * delta_h;
    diff = (fx(x0) - fx(x0 - h_mundur(i))) / h_mundur(i);
    error_mundur(i) = abs((diff - eksak) / eksak) * 100;
    hasil_turunan_mundur(i) = diff;
end

% Tampilkan tabel hasil hampiran selisih mundur
fprintf('--------------------------------------------------------------\n');
fprintf('   h           Nilai Turunan            Error\n');
fprintf('--------------------------------------------------------------\n');
for i = 1:num_iter
    fprintf('%10.6f   %15.6f   %15.6f\n', h_mundur(i), hasil_turunan_mundur(i), error_mundur(i));
end
fprintf('--------------------------------------------------------------\n');

% Tampilkan grafik nilai turunan hampiran selisih mundur
figure; % Membuat figure baru
plot(h_mundur, hasil_turunan_mundur, 'b-'); % Plot nilai turunan dari metode hampiran selisih mundur
title('Hampiran Selisih Mundur Orde 1 - Nilai Turunan Numerik'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Nilai Turunan'); % Label sumbu y
grid on; % Menampilkan grid

% Tampilkan grafik error hampiran selisih mundur
figure; % Membuat figure baru
plot(h_mundur, error_mundur, 'r--'); % Plot error dari metode hampiran selisih mundur
title('Hampiran Selisih Mundur Orde 1 - Grafik Error'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Error'); % Label sumbu y
grid on; % Menampilkan grid

%% Plot grafik nilai turunan semua metode dalam satu grafik
figure; % Membuat figure baru
hold on; % Memulai penggambaran data tanpa menghapus yang sudah ada
plot(h_terpusat, hasil_turunan_terpusat, 'b-', 'DisplayName', 'Hampiran Selisih Terpusat'); % Plot nilai turunan dari metode hampiran selisih terpusat
plot(h_maju, hasil_turunan_maju, 'r-', 'DisplayName', 'Hampiran Selisih Maju'); % Plot nilai turunan dari metode hampiran selisih maju
plot(h_mundur, hasil_turunan_mundur, 'g-', 'DisplayName', 'Hampiran Selisih Mundur'); % Plot nilai turunan dari metode hampiran selisih mundur
title('Grafik Nilai Turunan - Semua Metode'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Nilai Turunan'); % Label sumbu y
legend('Location', 'best'); % Menampilkan legenda di lokasi terbaik
grid on; % Menampilkan grid
hold off; % Mengakhiri penggambaran data dan mengaktifkan mode penggambaran normal

%% Plot grafik error semua metode dalam satu grafik
figure; % Membuat figure baru
hold on; % Memulai penggambaran data tanpa menghapus yang sudah ada
plot(h_terpusat, error_terpusat, 'b-', 'DisplayName', 'Hampiran Selisih Terpusat'); % Plot error dari metode hampiran selisih terpusat
plot(h_maju, error_maju, 'r-', 'DisplayName', 'Hampiran Selisih Maju'); % Plot error dari metode hampiran selisih maju
plot(h_mundur, error_mundur, 'g-', 'DisplayName', 'Hampiran Selisih Mundur'); % Plot error dari metode hampiran selisih mundur
title('Grafik Error - Semua Metode'); % Judul grafik
xlabel('h'); % Label sumbu x
ylabel('Error'); % Label sumbu y
legend('Location', 'best'); % Menampilkan legenda di lokasi terbaik
grid on; % Menampilkan grid
hold off; % Mengakhiri penggambaran data dan mengaktifkan mode penggambaran normal