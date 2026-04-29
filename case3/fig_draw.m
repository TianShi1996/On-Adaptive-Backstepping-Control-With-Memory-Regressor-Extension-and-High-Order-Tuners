clear
close all
clc
load case3_data.mat;

%% figure
color_ForgetMRE='#006400';
color_FullMRE="#EE6A50";
color_DiscMRE='#0072BD';
color_IntMRE='#7E2F8E';
% color_e='#CD3333';color_g='#6B8E23';
ftsize=12;
ylen=200;

close all
Pos=zeros(4,4);
for k=4:-1:1
    Pos(k,:)=[0.12,0.98-k*0.120*7/4,0.85,0.105*7/4];
end

h=figure(1);set(h,'Position',[1000,400,560,840/7*4]);
h1=subplot(411);
% set(h1,'Position',Pos(1,:))
% h=figure(1);set(h,'position',[1000,460,560,160*4])
% subplot(411)
plot(ForgetMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,0,0.6]);yticks(0:0.2:0.6);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-10,0.3]);title('');
text(-24,0.6,'(a)','FontName','Times New Roman','FontSize',ftsize);
text(40,0.4,'forgetting-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

h2=subplot(412);
% set(h2,'Position',Pos(2,:))
plot(FullMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,0,0.6]);yticks(0:0.2:0.6);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-10,0.3]);title('');
text(-24,0.6,'(b)','FontName','Times New Roman','FontSize',ftsize);
text(40,0.4,'full-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

h3=subplot(413);
% set(h3,'Position',Pos(3,:))
plot(DiscMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,0,0.6]);yticks(0:0.2:0.6);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-10,0.3]);title('');
text(-24,0.6,'(c)','FontName','Times New Roman','FontSize',ftsize);
text(40,0.4,'discrete-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

h4=subplot(414);
% set(h4,'Position',Pos(4,:))
plot(IntMRE.th_e,'-','linewidth',1.8);
axis([0,ylen,0,0.6]);yticks(0:0.2:0.6);box off 
xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-10,0.3]);title('');
text(-24,0.6,'(d)','FontName','Times New Roman','FontSize',ftsize);
text(40,0.4,'interval-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize);
xlabel('Time (s)');
print('fig/sim3_th_err.eps','-depsc');

%%
clc
close all
Pos=zeros(2,4);
for k=2:-1:1
    Pos(k,:)=[0.12,0.98-k*0.42,0.85,0.38];
end

h=figure(2);set(h,'Position',[1000,400,560,1080/7*1.5*2]);
% h1=subplot(311);
% set(h1,'Position',Pos(1,:))
% plot(ForgetMRE.th_err.Time(1:100:end),ForgetMRE.th_err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
% plot(FullMRE.th_err.Time(1:100:end),FullMRE.th_err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
% plot(DiscMRE.th_err.Time(1:100:end),DiscMRE.th_err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
% plot(IntMRE.th_err.Time(1:100:end),IntMRE.th_err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% axis([0,ylen,0,0.9]);yticks(0:0.3:0.9);box off 
% xlabel('');ylabel('\boldmath{$\|\tilde\theta\|$}','Interpreter','latex','Position',[-16,0.45]);title('');
% text(-24,0.9,'(a)','FontName','Times New Roman','FontSize',ftsize);
% legend('forgetting-data MRE-HOT','full-data MRE-HOT','discrete-data MRE-HOT','interval-data MRE-HOT',...
%     'NumColumns',2,'FontSize',ftsize-2);
% set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);
% 
% axes('Position',[0.2,0.78,0.34,0.08]);
% plot(ForgetMRE.th_err.Time(1:100:end),ForgetMRE.th_err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
% plot(FullMRE.th_err.Time(1:100:end),FullMRE.th_err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
% plot(DiscMRE.th_err.Time(1:100:end),DiscMRE.th_err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
% plot(IntMRE.th_err.Time(1:100:end),IntMRE.th_err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% axis([0,200,0,0.06]);yticks([0:0.02:0.06]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize-2);

h1=subplot(211);
set(h1,'Position',Pos(1,:))
plot(ForgetMRE.err.Time(1:100:end),ForgetMRE.err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.err.Time(1:100:end),FullMRE.err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.err.Time(1:100:end),DiscMRE.err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.err.Time(1:100:end),IntMRE.err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
axis([0,ylen,0,0.8]);yticks(0:0.4:0.8);box off 
xlabel('');ylabel('$|e_1|$','Interpreter','latex','Position',[-16,0.4]);title('');
text(-24,0.8,'(a)','FontName','Times New Roman','FontSize',ftsize);
legend('forgetting-data MRE-HOT','full-data MRE-HOT','discrete-data MRE-HOT','interval-data MRE-HOT',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

axes('Position',[0.2,0.65,0.34,0.12]);
plot(ForgetMRE.err.Time(1:100:end),ForgetMRE.err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.err.Time(1:100:end),FullMRE.err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.err.Time(1:100:end),DiscMRE.err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.err.Time(1:100:end),IntMRE.err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% plot(ForgetMRE.err,'--','color',color_ForgetMRE,'linewidth',2);
% plot(DiscMRE.err,'-','color',color_DiscMRE,'linewidth',1.5);
% plot(IntMRE.err,'-.','color',color_IntMRE,'linewidth',1.2);
axis([80,100,0,0.02]);yticks([0:0.01:0.02]);
xlabel('');ylabel('');title('');box off 
set(gca,'FontName','Times New Roman','FontSize',ftsize);

h2=subplot(212);
set(h2,'Position',Pos(2,:))
% h=figure(3);set(h,'position',[1000,760,560,170])
plot(ForgetMRE.excitation.Time(1:100:end),ForgetMRE.excitation.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.excitation.Time(1:100:end),FullMRE.excitation.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.excitation.Time(1:100:end),DiscMRE.excitation.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.excitation.Time(1:100:end),IntMRE.excitation.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
axis([0,ylen,0,6]);yticks([0:2:6]);box off 
xlabel('Time (s)');ylabel('$\sigma_{\rm{c}}$','Interpreter','latex','Position',[-16,3]);title('');
text(-24,6,'(b)','FontName','Times New Roman','FontSize',ftsize);
legend('forgetting-data MRE-HOT','full-data MRE-HOT','discrete-data MRE-HOT','interval-data MRE-HOT',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize);

axes('Position',[0.2,0.25,0.34,0.12]);
plot(ForgetMRE.excitation.Time(1:100:end),ForgetMRE.excitation.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.excitation.Time(1:100:end),FullMRE.excitation.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.excitation.Time(1:100:end),DiscMRE.excitation.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.excitation.Time(1:100:end),IntMRE.excitation.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
axis([80,100,0,0.15]);yticks([0:0.05:0.15]);
xlabel('');ylabel('');title('');box off 
set(gca,'FontName','Times New Roman','FontSize',ftsize);

print('fig/sim3_results.eps','-depsc');



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




