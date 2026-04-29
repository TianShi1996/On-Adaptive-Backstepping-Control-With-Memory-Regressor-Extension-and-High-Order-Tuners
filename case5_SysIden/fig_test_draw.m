clear
close all
clc



color_ForgetMRE='#006400';
color_FullMRE="#EE6A50";
color_DiscMRE='#0072BD';
color_IntMRE='#7E2F8E';
% color_e='#CD3333';color_g='#6B8E23';
ftsize=12;

Ts=1e-3;
load case5_data.mat;

%% Trajectory
close all
% load traj.mat;
traj=ForgetMRE.traj;
Pos=zeros(2,4);
T1=300;T2=500;
for k=2:-1:1
    Pos(k,:)=[0.08+0.49*(k-1),0.34,0.4,0.62];
end
h=figure(1);set(h,'Position',[1000,400,560,150]);
h1=subplot(121);set(h1,'Position',Pos(1,:))
plot(traj.Time(1:10:T1/Ts),traj.Data(1:10:T1/Ts),'-','color','#0072BD','linewidth',2);%hold on
xlabel('Time (s)');ylabel('$y_{\rm{r}}$','Interpreter','latex','Position',[-20,0]);title('');
text(-45,0.6,'(a)','FontName','Times New Roman','FontSize',ftsize);
axis([0,300,-0.6,0.6]);yticks(-0.4:0.4:0.4);box off 
set(gca,'FontName','Times New Roman','FontSize',ftsize);

h1=subplot(122);set(h1,'Position',Pos(2,:))
plot(traj.Time(T2/Ts-200/Ts:10:T2/Ts),traj.Data(T2/Ts-200/Ts:10:T2/Ts),'-','color','#D95319','linewidth',2);%hold on
xlabel('Time (s)');%ylabel('$y_{\rm{r}}$','Interpreter','latex','Position',[-15+300,-0.2]);title('');
text(-45/3*2+300,-0.05,'(b)','FontName','Times New Roman','FontSize',ftsize);
axis([300,500,-0.35,-0.05]);box off 
set(gca,'FontName','Times New Roman','FontSize',ftsize);
print('fig/sim3_traj.eps','-depsc');



%% Train
% close all
load case5_data.mat;
Pos=zeros(3,4);
for k=3:-1:1
    Pos(k,:)=[0.12,0.98-k*0.3,0.85,0.26];
end

ylen=500;
h=figure(2);set(h,'Position',[1000,200,560,1200/7*4]);
h1=subplot(311);
set(h1,'Position',Pos(1,:))
plot(ForgetMRE.th_err.Time(1:100:end),ForgetMRE.th_err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.th_err.Time(1:100:end),FullMRE.th_err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.th_err.Time(1:100:end),DiscMRE.th_err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.th_err.Time(1:100:end),IntMRE.th_err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% plot(120*ones(2,1),linspace(0,1,2),'k--','linewidth',0.7);
plot(300*ones(2,1),linspace(0,2,2),'k--','linewidth',0.7);
text(200,0.7,'Training','FontName','Times New Roman','FontSize',ftsize)
text(210,0.52,'stage','FontName','Times New Roman','FontSize',ftsize)
text(355,0.7,'Testing','FontName','Times New Roman','FontSize',ftsize)
text(365,0.52,'stage','FontName','Times New Roman','FontSize',ftsize)

axis([0,ylen,0,1.5]);yticks(0:0.5:1.5);box off 
xlabel('');ylabel('\boldmath{$\|\tilde\theta\|$}','Interpreter','latex','Position',[-8*5,0.75]);title('');
text(-12*5,1.5,'(a)','FontName','Times New Roman','FontSize',ftsize);
legend('forgetting-data MRE-HOT','full-data MRE-HOT','discrete-data MRE-HOT','interval-data MRE-HOT',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

% axes('Position',[0.45,0.77,0.34,0.08]);
% plot(ForgetMRE.th_err.Time(1:100:end),ForgetMRE.th_err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
% plot(FullMRE.th_err.Time(1:100:end),FullMRE.th_err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
% plot(DiscMRE.th_err.Time(1:100:end),DiscMRE.th_err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
% plot(IntMRE.th_err.Time(1:100:end),IntMRE.th_err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% axis([100,400,-0.001,0.06]);yticks([0:0.03:0.06]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize);



h1=subplot(312);
set(h1,'Position',Pos(2,:))
plot(ForgetMRE.err.Time(1:100:end),ForgetMRE.err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.err.Time(1:100:end),FullMRE.err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.err.Time(1:100:end),DiscMRE.err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.err.Time(1:100:end),IntMRE.err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% plot(120*ones(2,1),linspace(0,1,2),'k--','linewidth',0.7);
plot(300*ones(2,1),linspace(0,1,2),'k--','linewidth',0.7);
text(200,0.12,'Training','FontName','Times New Roman','FontSize',ftsize)
text(210,0.08,'stage','FontName','Times New Roman','FontSize',ftsize)
text(355,0.12,'Testing','FontName','Times New Roman','FontSize',ftsize)
text(365,0.08,'stage','FontName','Times New Roman','FontSize',ftsize)

axis([0,ylen,0,0.3]);yticks(0:0.1:0.3);box off 
xlabel('');ylabel('$|e_1|$','Interpreter','latex','Position',[-8*4,0.3/2]);title('');
text(-12*5,0.3,'(b)','FontName','Times New Roman','FontSize',ftsize);
legend('forgetting-data MRE-HOT','full-data MRE-HOT','discrete-data MRE-HOT','interval-data MRE-HOT',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);

axes('Position',[0.2,0.54,0.24,0.09]);
plot(ForgetMRE.err.Time(1:100:end),ForgetMRE.err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.err.Time(1:100:end),FullMRE.err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.err.Time(1:100:end),DiscMRE.err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.err.Time(1:100:end),IntMRE.err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
axis([0,40,0,0.35]);yticks([0:0.1:0.35]);
xlabel('');ylabel('');title('');box off 
set(gca,'FontName','Times New Roman','FontSize',ftsize,'Color','none');

h1=subplot(313);
set(h1,'Position',Pos(3,:))
plot(ForgetMRE.pre_err.Time(1:100:end),ForgetMRE.excitation.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
plot(FullMRE.pre_err.Time(1:100:end),FullMRE.excitation.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
plot(DiscMRE.pre_err.Time(1:100:end),DiscMRE.excitation.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
plot(IntMRE.pre_err.Time(1:100:end),IntMRE.excitation.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% plot(120*ones(2,1),linspace(0,1,2),'k--','linewidth',0.7);
plot(300*ones(2,1),linspace(0,1,2),'k--','linewidth',0.7);
text(200,0.36,'Training','FontName','Times New Roman','FontSize',ftsize)
text(210,0.25,'stage','FontName','Times New Roman','FontSize',ftsize)
text(355,0.36,'Testing','FontName','Times New Roman','FontSize',ftsize)
text(360,0.25,'stage','FontName','Times New Roman','FontSize',ftsize)

axis([0,ylen,0,0.9]);yticks(0:0.3:0.9);box off 
xlabel('Time (s)');ylabel('$\sigma_{\rm{c}}$','Interpreter','latex','Position',[-8*5,0.45]);title('');
text(-12*5,0.9,'(c)','FontName','Times New Roman','FontSize',ftsize);
legend('forgetting-data MRE-HOT','full-data MRE-HOT','discrete-data MRE-HOT','interval-data MRE-HOT',...
    'NumColumns',1,'FontSize',ftsize,'box','off');
set(gca,'FontName','Times New Roman','FontSize',ftsize);

% axes('Position',[0.2,0.20,0.24,0.09]);
% plot(ForgetMRE.pre_err.Time(1:100:end),ForgetMRE.excitation.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
% plot(FullMRE.pre_err.Time(1:100:end),FullMRE.excitation.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
% plot(DiscMRE.pre_err.Time(1:100:end),DiscMRE.excitation.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
% plot(IntMRE.pre_err.Time(1:100:end),IntMRE.excitation.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% axis([0,500,0,0.01]);yticks([0:0.01:0.01]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize);


print('fig/sim3.eps','-depsc');




%%
% load case5_testdata.mat;
% h1=subplot(212);set(h1,'Position',Pos(2,:))
% plot(ForgetMRE.err.Time(1:100:end),ForgetMRE.err.Data(1:100:end),'--','color',color_ForgetMRE,'linewidth',2);hold on
% plot(FullMRE.err.Time(1:100:end),FullMRE.err.Data(1:100:end),':','color',color_FullMRE,'linewidth',2.2);
% plot(DiscMRE.err.Time(1:100:end),DiscMRE.err.Data(1:100:end),'--','color',color_DiscMRE,'linewidth',1.8);
% plot(IntMRE.err.Time(1:100:end),IntMRE.err.Data(1:100:end),'-','color',color_IntMRE,'linewidth',1.6);
% % axis([0,ylen,-0.001,0.06]);yticks(0:0.02:0.06);box off 
% xlabel('');ylabel('$|e_1|$','Interpreter','latex','Position',[-8,0.15]);title('');
% text(-12,0.4,'(a)','FontName','Times New Roman','FontSize',ftsize);
% legend('forgetting-data MRE-HOT','full-data MRE-HOT','discrete-data MRE-HOT','interval-data MRE-HOT',...
%     'NumColumns',2,'FontSize',ftsize);
% set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);


% close all
% Pos=zeros(4,4);
% for k=4:-1:1
%     Pos(k,:)=[0.12,0.98-k*0.12*7/4,0.86,0.11*7/4];
% end
% 
% h=figure(1);set(h,'Position',[1000,400,560,840/7*4]);
% h1=subplot(411);
% set(h1,'Position',Pos(1,:))
% % h=figure(1);set(h,'position',[1000,460,560,160*4])
% % subplot(411)
% plot(ForgetMRE.th_e,'-','linewidth',1.8);
% axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
% xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5*1.5,0.25]);title('');
% text(-12*1.5,0.5,'(a)','FontName','Times New Roman','FontSize',ftsize);
% text(20*1.5,0.4,'forgetting-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
% legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
%     'NumColumns',1,'FontSize',ftsize);
% set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);
% 
% axes('Position',[0.62,0.84,0.18,0.08]);
% plot(ForgetMRE.th_e,'-','linewidth',1.8);
% axis([140,150,-0.001,0.01]);yticks([0:0.005:0.01]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize);
% 
% h2=subplot(412);
% set(h2,'Position',Pos(2,:))
% plot(FullMRE.th_e,'-','linewidth',1.8);
% axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
% xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5*1.5,0.25]);title('');
% text(-12*1.5,0.5,'(b)','FontName','Times New Roman','FontSize',ftsize);
% text(20*1.5,0.4,'full-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
% legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
%     'NumColumns',1,'FontSize',ftsize);
% set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);
% 
% axes('Position',[0.62,0.62,0.18,0.08]);
% plot(FullMRE.th_e,'-','linewidth',1.8);
% axis([140,150,-0.001,0.01]);yticks([0:0.005:0.01]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize);
% 
% h3=subplot(413);
% set(h3,'Position',Pos(3,:))
% plot(DiscMRE.th_e,'-','linewidth',1.8);
% axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
% xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5*1.5,0.25]);title('');
% text(-12*1.5,0.5,'(c)','FontName','Times New Roman','FontSize',ftsize);
% text(20*1.5,0.4,'discrete-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
% legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
%     'NumColumns',1,'FontSize',ftsize);
% set(gca,'FontName','Times New Roman','FontSize',ftsize,'xtick',[]);
% 
% axes('Position',[0.62,0.42,0.18,0.08]);
% plot(DiscMRE.th_e,'-','linewidth',1.8);
% axis([140,150,-0.001,0.02]);yticks([0:0.01:0.02]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize);
% 
% h4=subplot(414);
% set(h4,'Position',Pos(4,:))
% plot(IntMRE.th_e,'-','linewidth',1.8);
% axis([0,ylen,-0.01,0.5]);yticks(0:0.2:0.4);box off 
% xlabel('');ylabel('\boldmath$\tilde\theta$','Interpreter','latex','Position',[-5*1.5,0.25]);title('');
% text(-12*1.5,0.5,'(d)','FontName','Times New Roman','FontSize',ftsize);
% text(20*1.5,0.4,'interval-data MRE-HOT','FontName','Times New Roman','FontSize',ftsize)
% legend('$\tilde\theta_1$','$\tilde\theta_2$','$\tilde\theta_3$','Interpreter','latex',...
%     'NumColumns',1,'FontSize',ftsize);xlabel('Time (s)');
% set(gca,'FontName','Times New Roman','FontSize',ftsize);
% 
% axes('Position',[0.62,0.2,0.18,0.08]);
% plot(IntMRE.th_e,'-','linewidth',1.8);
% axis([140,150,-0.001,0.01]);yticks([0:0.005:0.01]);
% xlabel('');ylabel('');title('');box off 
% set(gca,'FontName','Times New Roman','FontSize',ftsize);
% 
% 
% print('fig/sim4_th_err.eps','-depsc');













