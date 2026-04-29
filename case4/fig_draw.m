clear
close all
clc
load case4_data.mat;

%% figure
color_ForgetMRE='#006400';
color_FullMRE="#EE6A50";
color_DiscMRE='#0072BD';
color_IntMRE='#7E2F8E';
% color_e='#CD3333';color_g='#6B8E23';
ftsize=12;
ylen=100;

close all
Pos=zeros(4,4);
for k=4:-1:1
    Pos(k,:)=[0.12,0.98-k*0.12*7/4,0.86,0.11*7/4];
end

h=figure(1);set(h,'Position',[1000,400,560,840/7*4]);
h1=subplot(411);
set(h1,'Position',Pos(1,:))
% h=figure(1);set(h,'position',[1000,460,560,160*4])
% subplot(411)
plot(ForgetMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5,0.25]);title('');
text(-12,0.5,'(a)','FontName','Times New Roman','FontSize',ftsize);
text(20,0.4,'by forgetting-data MRE','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize-2);
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

h2=subplot(412);
set(h2,'Position',Pos(2,:))
plot(FullMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5,0.25]);title('');
text(-12,0.5,'(b)','FontName','Times New Roman','FontSize',ftsize);
text(20,0.4,'by full-data MRE','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize-2);
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

h3=subplot(413);
set(h3,'Position',Pos(3,:))
plot(DiscMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5,0.25]);title('');
text(-12,0.5,'(c)','FontName','Times New Roman','FontSize',ftsize);
text(20,0.4,'by discrete-data MRE','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize-2);
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

h4=subplot(414);
set(h4,'Position',Pos(4,:))
plot(IntMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5,0.25]);title('');
text(-12,0.5,'(d)','FontName','Times New Roman','FontSize',ftsize);
text(20,0.4,'by interval-data MRE','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize-2);
set(gca,'FontName','Times New Roman','FontSize',ftsize);
xlabel('Time (s)');
print('fig/sim4_th_err.eps','-depsc');


Pos=zeros(2,4);
for k=2:-1:1
    Pos(k,:)=[0.12,0.98-k*0.12*7/2,0.86,0.11*7/2];
end

h=figure(2);set(h,'Position',[1000,400,560,1080/7*2]);
h1=subplot(211);
set(h1,'Position',Pos(1,:))
plot(ForgetMRE.err.Time(1:100:end),ForgetMRE.err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.err.Time(1:100:end),FullMRE.err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.err.Time(1:100:end),DiscMRE.err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.err.Time(1:100:end),IntMRE.err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
axis([0,ylen,-0.01,0.4]);yticks(0:0.2:0.4);box off 
xlabel('');ylabel('$|e_1|$','Interpreter','latex','Position',[-8,0.15]);title('');
text(-12,0.4,'(a)','FontName','Times New Roman','FontSize',ftsize);
legend('by forgetting-data MRE','by full-data MRE','by discrete-data MRE','by interval-data MRE',...
    'NumColumns',2,'FontSize',ftsize-2);
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

axes('Position',[0.28,0.64,0.3,0.17]);
plot(ForgetMRE.err.Time(1:100:end),ForgetMRE.err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.err.Time(1:100:end),FullMRE.err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.err.Time(1:100:end),DiscMRE.err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.err.Time(1:100:end),IntMRE.err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
axis([0,100,-0.001,0.01]);yticks([0:0.01]);
xlabel('');ylabel('');title('');box off 
set(gca,'FontName','Times New Roman','FontSize',ftsize-2);

h2=subplot(212);
set(h2,'Position',Pos(2,:))
% h=figure(3);set(h,'position',[1000,760,560,170])
plot(ForgetMRE.excitation.Time(1:100:end),ForgetMRE.excitation.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.excitation.Time(1:100:end),FullMRE.excitation.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.excitation.Time(1:100:end),DiscMRE.excitation.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.excitation.Time(1:100:end),IntMRE.excitation.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
axis([0,ylen,-0.005,0.8]);yticks([0:0.4:0.8]);box off 
xlabel('Time (s)');ylabel('$\sigma_{\rm{c}}$','Interpreter','latex','Position',[-8,0.4]);title('');
text(-12,0.8,'(b)','FontName','Times New Roman','FontSize',ftsize);
legend('by forgetting-data MRE','by full-data MRE','by discrete-data MRE','by interval-data MRE',...
    'NumColumns',2,'FontSize',ftsize-2);
set(gca,'FontName','Times New Roman','FontSize',ftsize);

% axes('Position',[0.18,0.22,0.3,0.17]);
% plot(ForgetMRE.excitation.Time(1:100:end),ForgetMRE.excitation.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
% plot(FullMRE.excitation.Time(1:100:end),FullMRE.excitation.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
% plot(DiscMRE.excitation.Time(1:100:end),DiscMRE.excitation.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
% plot(IntMRE.excitation.Time(1:100:end),IntMRE.excitation.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% axis([80,100,-0.005,0.15]);yticks([0:0.05:0.15]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize-2);

print('fig/sim4_results.eps','-depsc');



% h=figure(5);set(h,'position',[1000,760,560,150])
% plot(cldsc.u,'--','color',color_cldsc,'linewidth',1.2);hold on
% plot(mre.u,'--','color',color_mre,'linewidth',1.6);
% plot(clbc.u,'-','color',color_clbc,'linewidth',1.2);
% axis([0,ylen,-2,4]);
% xlabel('');ylabel('$u$','Interpreter','latex');title('');
% text(-14,4,'(b)','FontName','Times New Roman','FontSize',ftsize);
% legend('CL-DSC','MRE-HOT','CLBC','NumColumns',3);
% set(gca,'FontName','Times New Roman','FontSize',ftsize);
% 
% axes('Position',[0.24,0.5,0.25,0.25]);
% plot(cldsc.u,'--','color',color_cldsc,'linewidth',1.2);hold on
% plot(mre.u,'--','color',color_mre,'linewidth',1.6);
% plot(clbc.u,'-','color',color_clbc,'linewidth',1.2);
% axis([59,63,-1.5,1]);
% xlabel('');ylabel('');title('');
% 
% print('case2/sim2_u.eps','-depsc');
% 




