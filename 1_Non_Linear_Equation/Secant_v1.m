%% Secant
% the function is: f(x)=e^x-5
clear,clc

%% Input
f=@(x) exp(x) - 5; % fungsi yang akan dicari akar persamaannya
df=@(x) exp(x);    % turunan pertama

xBefore=input('x=');                        % nilai tebakan
delta=input('delta=');
xAfter=xBefore+delta;
targetError=input('Target Error=');   % batas error
maxiter=1000;                         % batas maksimal iterasi
er=100;                               % nilai awal error


%% Proses Iterasi
fprintf('iteration     xb       xNew         error\n')  % header tabel iterasi

for i=1:maxiter
    xNew=xBefore-f(xBefore)*(xBefore-xAfter)/(f(xBefore)-f(xAfter));         % hitung nilai x 'baru' dengan persamaan Secant
    er=abs((xAfter-xNew)/xNew)*100;             % hitung nilai error
    fprintf('%2d           %5.2f    %5.2f        %5.2f%% \n',i,xBefore,xNew,er) %tabel iterasi
    
     
    
    if er > targetError     % jika nilai error masih lebih besar dari target,
        xBefore=xAfter;
        xAfter=xNew;       % definisikan xNew sebagai xBefore untuk iterasi selanjutnya.
    else                    % jika nilai error < target
        fprintf('\nThe root is %f\n',xNew)
        break               % hentikan proses iterasi
    end
end