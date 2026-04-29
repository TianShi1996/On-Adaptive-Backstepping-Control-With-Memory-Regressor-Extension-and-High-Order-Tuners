clear
close all
clc


load traj_test.mat;traj=traj_test;
Initial_par;


%%

tic;ForgetMRE=sim("sim_ForgetMRE_case5.mdl",500);t_formre=toc;
tic;FullMRE=sim("sim_FullMRE_case5.mdl",500);t_fullmre=toc;
tic;DiscMRE=sim("sim_DiscMRE_case5.mdl",500);t_discmre=toc;
tic;IntMRE=sim("sim_IntMRE_case5.mdl",500);t_intmre=toc;

save('case5_data','ForgetMRE','FullMRE','DiscMRE','IntMRE');

[t_formre,t_fullmre,t_discmre,t_intmre]'
%%
% clc
% load case5_data.mat;
% load traj_test.mat;
% Test_par;
% traj=traj_test;
% th_hat=mean_th(ForgetMRE,Ts);
% ForgetMRE=sim("sim_test_case5.mdl",25);
% th_hat=mean_th(FullMRE,Ts);
% FullMRE=sim("sim_test_case5.mdl",25);
% th_hat=mean_th(DiscMRE,Ts);
% DiscMRE=sim("sim_test_case5.mdl",25);
% th_hat=mean_th(IntMRE,Ts);
% IntMRE=sim("sim_test_case5.mdl",25);
% 
% save('case5_testdata','ForgetMRE','FullMRE','DiscMRE','IntMRE');
% 
% fig_test_draw;
% 
% 
% function th_hat=mean_th(MRE,Ts)
% ind=140/Ts:150/Ts;
% th=[0.4,0.5,0.1]';
% th_hat_vec=reshape(th-MRE.th_e.Data(:,1,ind),3,length(ind));
% th_hat=sum(th_hat_vec,2)/length(ind);
% end