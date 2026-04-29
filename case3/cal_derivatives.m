clear
clc

syms x1 x2 x3;
syms th1 th2 th3 dth1 dth2 dth3 ddth1 ddth2 ddth3;
syms yr dyr ddyr dddyr;
syms t;
syms c1 c2 c3;
syms kap1 kap2 kap3;

psi1=zeros(3,1);psi2=[-x2;-x1;-x1^3];psi3=zeros(3,1);
phi1=psi1;
z1=x1-yr;

alpha1=-c1*z1-kap1*[phi1(1),phi1(2),phi1(3)]*phi1*z1-[th1,th2,th3]*phi1;

Dalpha1Dx1=diff(alpha1,x1);
Dalpha1Dth=[diff(alpha1,th1),diff(alpha1,th2),diff(alpha1,th3)];
Dalpha1Dyd=diff(alpha1,yr);

z2=x2-alpha1-dyr;
phi2=psi2-Dalpha1Dx1*psi1
alpha2=-z1-c2*z2-kap2*[phi2(1),phi2(2),phi2(3)]*phi2*z2-[th1,th2,th3]*phi2...
    +Dalpha1Dx1*x2+Dalpha1Dth*[dth1;dth2;dth3]+Dalpha1Dyd*dyr

Dalpha2Dx1=diff(alpha2,x1)
Dalpha2Dx2=diff(alpha2,x2)
Dalpha2Dth=[diff(alpha2,th1);diff(alpha2,th2);diff(alpha2,th3)]
Dalpha2Ddth=[diff(alpha2,dth1);diff(alpha2,dth2);diff(alpha2,dth3)]
Dalpha2Dyd=diff(alpha2,yr)
Dalpha2Ddyd=diff(alpha2,dyr)

phi3=psi3-Dalpha2Dx1*psi1-Dalpha2Dx2*psi2;








