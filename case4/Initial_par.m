
% clear
% close all
% clc
Ts=1e-3;

x0=[0,0,0]';
% x0=[1,0,0]';
% th=[0.1,0.5,1.5]';
th=[0.4,0.5,0.1]';
N=3;n=3;

% control gain
c1=1;c2=1;c3=1;
c=[c1,c2,c3];

% damping
kap1=0.1;kap2=0.1;kap3=0.1;
kpa=[kap1,kap2,kap3];

b0=30;b1=11;   % high-order tuner parameters

% noise
SD=1e-3;
vari=SD^2;

gamma=1;            % learning rate

%% Forgetting data MRE
lambda=1;           % forgetting rate

%% Discrete data MRE
curN =10;

%% Interval data MRE
tau_d=5;   % length of internal integral
ka=1;kb=1;

%% Initialization
thd=zeros(3,3);
% kpa=zeros(3,1);
% kpa=kpa_mre;
% yd0=[0,1,0,-1]';

yd0=[0,0,0,0]';
% Phi0=Regressor(x0,thd,yd0,kpa,c);
% Phi0
[alpha10,alpha20,u,z0,Phi0]=virtual_ctrl(x0,thd,yd0,kpa,c);
% z10=x0(1)-yd0(1);
% z20=x0(2)-alpha10-yd0(2);
% z30=x0(3)-alpha20-yd0(3);
% zeta0=-[z10,z20,z30]'
z0
zeta0=-z0;