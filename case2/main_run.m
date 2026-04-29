clear
close all
clc



Initial_par;


%%

ForgetMRE=sim("sim_ForgetMRE_case2.mdl",100);
FullMRE=sim("sim_FullMRE_case2.mdl",100);
DiscMRE=sim("sim_DiscMRE_case2.mdl",100);
IntMRE=sim("sim_IntMRE_case2.mdl",100);


save('case2_data','ForgetMRE','FullMRE','DiscMRE','IntMRE');


