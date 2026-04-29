function [alpha1,alpha2,u,z,Phi]=virtual_ctrl(x,th_ext,yr_ext,kpa,c)
x1=x(1);x2=x(2);x3=x(3);
th=th_ext(:,1);dth=th_ext(:,2);ddth=th_ext(:,3);
th1=th(1);th2=th(2);th3=th(3);
dth1=dth(1);dth2=dth(2);dth3=dth(3);
ddth1=ddth(1);ddth2=ddth(2);ddth3=ddth(3);
Phi=Regressor(x,th_ext,yr_ext,kpa,c);
phi1=Phi(:,1);phi2=Phi(:,2);phi3=Phi(:,3);

yr=yr_ext(1);dyr=yr_ext(2);ddyr=yr_ext(3);dddyr=yr_ext(4);

c1=c(1);c2=c(2);c3=c(3);
% kap1=0.1;kap2=0.1;kap3=0.1;
kap1=kpa(1);kap2=kpa(2);kap3=kpa(3);
% z1=z(1);z2=z(2);z3=z(3);

z1=x1-yr;
alpha1=-c1*z1-kap1*phi1'*phi1*z1-th'*phi1;

Dalpha1Dx1=- c1;
Dalpha1Dth=zeros(1,3);
Dalpha1Dyd=c1;

z2=x2-alpha1-dyr;
alpha2=-z1-c2*z2-kap2*phi2'*phi2*z2-th'*phi2...
    +Dalpha1Dx1*x2+Dalpha1Dth*dth+Dalpha1Dyd*dyr;
 
Dalpha2Dx1 = th2 - c1*(kap2*x1^6 + kap2*x1^2 + kap2*x2^2) - c1*c2 + 3*th3*x1^2 - (6*kap2*x1^5 + 2*kap2*x1)*(x2 - dyr + c1*(x1 - yr)) - 1;
Dalpha2Dx2 = th1 - c2 - c1 - kap2*x1^2 - kap2*x2^2 - kap2*x1^6 - 2*kap2*x2*(x2 - dyr + c1*(x1 - yr));

Dalpha2Dth = [x2;x1;x1^3];
Dalpha2Ddth = [0,0,0]';

Dalpha2Dyd = c1*(kap2*x1^6 + kap2*x1^2 + kap2*x2^2) + c1*c2 + 1;
Dalpha2Ddyd = kap2*x1^6 + kap2*x1^2 + kap2*x2^2 + c1 + c2;

z3=x3-alpha2-ddyr;

u=-z2-c3*z3-kap3*norm(phi3)^2*z3-phi3'*th...
    +Dalpha2Dx1*x2+Dalpha2Dx2*x3+Dalpha2Dth'*dth+Dalpha2Ddth'*ddth+Dalpha2Dyd*dyr+Dalpha2Ddyd*ddyr+dddyr;


z=[z1,z2,z3]';






