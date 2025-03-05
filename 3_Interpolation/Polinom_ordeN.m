%Interpolasi Orde N
N= 2;
t(1)=0;
t(2)=20;
t(3)=22;
y(1)=-1900;
y(2)=100;
y(3)=80;
tx=19;
yt=0;
%Algoritm
for j=1:N+1
  r1=1; 
  r2=1;
  for k=1:N+1
    if j~=k  
    r1=r1*(tx-t(k));
    r2=r2*(t(j)-t(k));
    end
  end
  yt=yt+r1*y(j)/r2;
end
yt
