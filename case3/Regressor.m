function Phi=Regressor(x,th_ext,yr_ext,kpa,c)
x1=x(1);x2=x(2);x3=x(3);
th=th_ext(:,1);dth=th_ext(:,2);ddth=th_ext(:,3);
th1=th(1);th2=th(2);th3=th(3);
dth1=dth(1);dth2=dth(2);dth3=dth(3);
ddth1=ddth(1);ddth2=ddth(2);ddth3=ddth(3);
yr=yr_ext(1);dyr=yr_ext(2);ddyr=yr_ext(3);dddyr=yr_ext(4);

c1=c(1);c2=c(2);c3=c(3);
kap1=kpa(1);kap2=kpa(2);kap3=kpa(3);


psi1=zeros(3,1);psi2=[-x2;-x1;-x1^3];psi3=zeros(3,1);
phi1=psi1;

Dalpha1Dx1=- c1;
phi2=psi2-Dalpha1Dx1*psi1;

Dalpha2Dx1 = th2 - c1*(kap2*x1^6 + kap2*x1^2 + kap2*x2^2) - c1*c2 + 3*th3*x1^2 - (6*kap2*x1^5 + 2*kap2*x1)*(x2 - dyr + c1*(x1 - yr)) - 1;
Dalpha2Dx2 = th1 - c2 - c1 - kap2*x1^2 - kap2*x2^2 - kap2*x1^6 - 2*kap2*x2*(x2 - dyr + c1*(x1 - yr));
phi3=psi3-Dalpha2Dx1*psi1-Dalpha2Dx2*psi2;

Phi=[phi1,phi2,phi3];
