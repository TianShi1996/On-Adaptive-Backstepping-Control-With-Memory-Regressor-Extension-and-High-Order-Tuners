function [sys,x0,str,ts]=TO_sys(t,x,u,flag,x_init,th)
switch flag
    case 0
        [sys,x0,str,ts]=mdlInitializeSizes(x_init);
    case 1
        sys=mdlDerivatives(t,x,u,th);
    case 3
        sys=mdlOutputs(t,x,th);
    case{2,4,9}
        sys=[];
    otherwise
        error(['Unhandled flag']);
end

function [sys,x0,str,ts]=mdlInitializeSizes(x_init)
sizes=simsizes;
sizes.NumContStates=3;
sizes.NumDiscStates=0;
sizes.NumInputs=1;
sizes.NumOutputs=6;
sizes.DirFeedthrough=1;
sizes.NumSampleTimes=0;

sys=simsizes(sizes);
x0=x_init;


str=[];ts=[];

function sys=mdlDerivatives(t,x,u,th)
x1=x(1);x2=x(2);x3=x(3);
phi=[-x2,-x1,-x1^3]';
thd=th;
% thd=th*(1+0.2*sin(2*pi/200*t));
dx1=x2;
dx2=x3+phi'*thd;
dx3=u;
sys=[dx1;dx2;dx3];


function sys=mdlOutputs(t,x,th)
% thd=th*(1+0.2*sin(2*pi/200*t));
thd=th;
sys=[x;thd];






















