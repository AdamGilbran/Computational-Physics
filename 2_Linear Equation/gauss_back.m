% Gauss Back-Substitotion Method for Linear Equation
% A X = B
%% Input Matrix A and B
N=input('input the ordo=') ;%Ordo Matrix
%Define Matrix A
A=zeros(N,N) ; %Make All Value in Matrix A (NxN) to zero 
for i=1:N
    fprintf("row %d\n",i)
    for l=1:N
        A(i,l)=input("input velue into the matrix=");
    end
end

%Define Matrix B
B=zeros(N,1);%Make All Value in Matrix B (Nx1) to zero 
for i=1:N
    B(i,1)=input("masukkan hasil persamaan=");
end
B
% Augmentasi Matrix A and Matrix B
C=[A B];
%% Gauss Algoritm for the Matrix C
for p=1:N-1
    fprintf("\nBaris %d", p)
    C
   for k=p+1:N;
       fprintf("\nKolom %d", k)
       %Elimination process for column p
       m=C(k,p)/C(p,p);
       fprintf("\npivot baris %d terhadap baris %d = %.2f", k, p, m)
       C(k,p:N+1)=C(k,p:N+1)-m*C(p,p:N+1);
       fprintf("\nSetelah di operasikan, baris ke-%d dikurangi %.2f kalinya baris ke-%d", k, p, m)
       C
   end
end
%% Back Subtitution Algoritm
%Sprad the Matrix C become two matix (NxN) and (Nx)
A=C(1:N, 1:N);
B=C(1:N, N+1);

%Iteration for Back Subtitution
fprintf("\nback subtitution")
X=zeros(N,1);
for k=N:-1:1
   X(k)=(B(k)-A(k,k+1:N)*X(k+1:N))/A(k,k);
end
X