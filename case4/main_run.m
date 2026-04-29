clear
close all
clc



Initial_par;


%%

tic;ForgetMRE=sim("sim_ForgetMRE_case4.mdl",200);t_formre=toc;
tic;FullMRE=sim("sim_FullMRE_case4.mdl",200);t_fullmre=toc;
tic;DiscMRE=sim("sim_DiscMRE_case4.mdl",200);t_discmre=toc;
tic;IntMRE=sim("sim_IntMRE_case4.mdl",200);t_intmre=toc;

save('case4_data','ForgetMRE','FullMRE','DiscMRE','IntMRE');



[t_formre,t_fullmre,t_discmre,t_intmre]'