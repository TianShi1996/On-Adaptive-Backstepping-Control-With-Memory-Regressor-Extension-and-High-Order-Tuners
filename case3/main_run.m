clear
close all
clc



Initial_par;


%%

tic;ForgetMRE=sim("sim_ForgetMRE_case3.mdl",200);t_formre=toc;
tic;FullMRE=sim("sim_FullMRE_case3.mdl",200);t_fullmre=toc;
tic;DiscMRE=sim("sim_DiscMRE_case3.mdl",200);t_discmre=toc;
tic;IntMRE=sim("sim_IntMRE_case3.mdl",200);t_intmre=toc;


save('case3_data','ForgetMRE','FullMRE','DiscMRE','IntMRE');


[t_formre,t_fullmre,t_discmre,t_intmre]'