%Coding Polinomial orde 1
% Massa   12  16 sb x
% F(gaya) 40  50 sb y
% Mencari gaya pada M = 14

m1=input('m1='); % masukkan nilai x1 
m2=input('m2='); % nilai massa 2
F1=input('f1=');%nilai gaya pada massa 1
F2=input('f2=');%nilai gaya pada massa 1
m=input('m='); % nilai F yang ingin di cari dengan nilai x
A0 = ((m2*F1)-(m1*F2))/(m2-m1) %rumus mencari A0
A1 = (F2-F1)/(m2-m1)% rumus mencari A1
Fm = A0+(A1*m)% rumus polinomial
Fm