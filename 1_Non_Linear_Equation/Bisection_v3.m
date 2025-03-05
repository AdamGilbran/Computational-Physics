clear all; clc; close all;
%Bisection with funciton in this script
%function
f = @(x) exp(x)-5;

%%Input
bracket_left =0 ; %batas kiri
bracket_right = 3;  %batas kanan
tolerance_error=0.1;
relative_error=10; 
iteration=0;
x_root0=bracket_left;

%Pembuatan header tabel (decoration)
fprintf('==========================================\n')
fprintf('iteration c ErrorRelatif    interval \n')
fprintf('==========================================\n')

%%Algoritm

%Algoritm for great bracket
%f0=f(bracket_left)*f(bracket_right);   % Perhitungan syarat bisection
%if f0 >= 0        % Jika nilai syarat bisection > 0, gunakan batas lain
%end

%Algoritm for iteration
while relative_error > tolerance_error
  iteration=iteration+1;
  x_root = (bracket_left + bracket_right)/2;
    
  if f(bracket_left)*f(x_root) == 0
    disp('c is solution');
  elseif f(bracket_left)*f(x_root)<0
    bracket_right=x_root;
  else
    bracket_left=x_root;
  end
  relative_error= abs((x_root-x_root0)/x_root); %update niali errornya
  fprintf('%d %f %8.8f (%f; %f)\n',iteration, x_root, relative_error, bracket_left, bracket_right)
end
