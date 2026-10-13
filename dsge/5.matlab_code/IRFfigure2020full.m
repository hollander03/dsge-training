%% epsil_ms (money supply)
clear

firfms = figure;
subplot(3,3,1);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_ms*100,'k','LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);  % 'g' = [0 1 0]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_ms*100,':','Color','m','LineWidth',2); % 'm' = [1 0 1]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

clear
subplot(3,3,2);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_ms*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_ms*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,3);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_ms*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_ms*100,':k','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_ms*100,':k','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_ms*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,4);
hold
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_ms*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_ms*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,5);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_ms*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_ms*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,6);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_ms*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_ms*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,7);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_ms*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_ms*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,8);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_ms*100,'k','LineWidth',2);
%plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_ms*100,'--','Color',[0 1 0],'LineWidth',2);
clear 
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_ms*100,':','Color',[1 0 1],'LineWidth',2);
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_ms*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_ms*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_ms*100,':','Color',[0.75 0 0.75],'LineWidth',1);

ylabel(subplot(3,3,1),'%-dev. from s.s.')
ylabel(subplot(3,3,4),'percentage points')
ylabel(subplot(3,3,7),'%-dev. from s.s.')

title(subplot(3,3,1),'Money')
title(subplot(3,3,2),'Velocity')
title(subplot(3,3,3),'Price-level')
title(subplot(3,3,4),'Nominal interest rate')
title(subplot(3,3,5),'Inflation')
title(subplot(3,3,6),'Real interest rate')
title(subplot(3,3,7),'Output')
title(subplot(3,3,8),'Output gap')

lgd=legend('1959Q1--2007Q3','1984Q1--2007Q3','1959Q1--2019Q4','90% conf. band','Location','none','Position', [0.715 0.14 0.17 0.15]);

hold off;

%% epsil_md (money demand)
clear

firfmd = figure;
subplot(3,3,1);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_md*100,'k','LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);  % 'g' = [0 1 0]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_md*100,':','Color','m','LineWidth',2); % 'm' = [1 0 1]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

clear
subplot(3,3,2);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_md*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_md*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,3);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_md*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_md*100,':k','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_md*100,':k','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_md*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,4);
hold
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_md*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_md*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,5);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_md*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_md*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,6);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_md*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_md*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,7);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_md*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_md*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,8);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_md*100,'k','LineWidth',2);
%plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_md*100,'--','Color',[0 1 0],'LineWidth',2);
clear 
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_md*100,':','Color',[1 0 1],'LineWidth',2);
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_md*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_md*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_md*100,':','Color',[0.75 0 0.75],'LineWidth',1);

ylabel(subplot(3,3,1),'%-dev. from s.s.')
ylabel(subplot(3,3,4),'percentage points')
ylabel(subplot(3,3,7),'%-dev. from s.s.')

title(subplot(3,3,1),'Money')
title(subplot(3,3,2),'Velocity')
title(subplot(3,3,3),'Price-level')
title(subplot(3,3,4),'Nominal interest rate')
title(subplot(3,3,5),'Inflation')
title(subplot(3,3,6),'Real interest rate')
title(subplot(3,3,7),'Output')
title(subplot(3,3,8),'Output gap')

lgd=legend('1959Q1--2007Q3','1984Q1--2007Q3','1959Q1--2019Q4','90% conf. band','Location','none','Position', [0.715 0.14 0.17 0.15]);

hold off;
%% epsil_z (technology)

clear
firfz = figure;

subplot(3,3,1);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_z*100,'k','LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);  % 'g' = [0 1 0]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_z*100,':','Color','m','LineWidth',2); % 'm' = [1 0 1]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

clear
subplot(3,3,2);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_z*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_z*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,3);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_z*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_z*100,':k','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_z*100,':k','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_z*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,4);
hold
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_z*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_z*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,5);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_z*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_z*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,6);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_z*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_z*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,7);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_z*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_z*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,8);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_z*100,'k','LineWidth',2);
%plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_z*100,'--','Color',[0 1 0],'LineWidth',2);
clear 
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_z*100,':','Color',[1 0 1],'LineWidth',2);
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_z*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_z*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_z*100,':','Color',[0.75 0 0.75],'LineWidth',1);

hold off;

ylabel(subplot(3,3,1),'%-dev. from s.s.')
ylabel(subplot(3,3,4),'percentage points')
ylabel(subplot(3,3,7),'%-dev. from s.s.')

title(subplot(3,3,1),'Money')
title(subplot(3,3,2),'Velocity')
title(subplot(3,3,3),'Price-level')
title(subplot(3,3,4),'Nominal interest rate')
title(subplot(3,3,5),'Inflation')
title(subplot(3,3,6),'Real interest rate')
title(subplot(3,3,7),'Output')
title(subplot(3,3,8),'Output gap')

lgd=legend('1959Q1--2007Q3','1984Q1--2007Q3','1959Q1--2019Q4','90% conf. band','Location','none','Position', [0.715 0.14 0.17 0.15]);

%% epsil_i (interest rate target)

clear
firfi = figure;

subplot(3,3,1);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_i*100,'k','LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);  % 'g' = [0 1 0]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.m_epsil_i*100,':','Color','m','LineWidth',2); % 'm' = [1 0 1]
plot(oo_.PosteriorIRF.dsge.HPDinf.m_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.m_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

clear
subplot(3,3,2);
hold;
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_i*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.v_epsil_i*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.v_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.v_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,3);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_i*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_i*100,':k','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_i*100,':k','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.p_epsil_i*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.p_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.p_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,4);
hold
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_i*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.int_epsil_i*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.int_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.int_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,5);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_i*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.pii_epsil_i*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.pii_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.pii_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,6);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_i*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.r_epsil_i*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.r_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.r_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,7);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_i*100,'k','LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.y_epsil_i*100,':','Color',[1 0 1],'LineWidth',2); 
plot(oo_.PosteriorIRF.dsge.HPDinf.y_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.y_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

subplot(3,3,8);
hold;
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_i*100,'k','LineWidth',2);
%plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_i*100,'--','Color',[0 1 0],'LineWidth',2);
clear 
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.Mean.ytilde_epsil_i*100,':','Color',[1 0 1],'LineWidth',2);
clear
load('CH2020Est5907m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_i*100,':','Color',[0.5 0.5 0.5],'LineWidth',1);
clear
load('CH2020Est8407m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_i*100,':','Color',[0 0.75 0],'LineWidth',1);
clear
load('CH2020Est5919m4_results.mat')
plot(oo_.PosteriorIRF.dsge.HPDinf.ytilde_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);
plot(oo_.PosteriorIRF.dsge.HPDsup.ytilde_epsil_i*100,':','Color',[0.75 0 0.75],'LineWidth',1);

hold off;

ylabel(subplot(3,3,1),'%-dev. from s.s.')
ylabel(subplot(3,3,4),'percentage points')
ylabel(subplot(3,3,7),'%-dev. from s.s.')

title(subplot(3,3,1),'Money')
title(subplot(3,3,2),'Velocity')
title(subplot(3,3,3),'Price-level')
title(subplot(3,3,4),'Nominal interest rate')
title(subplot(3,3,5),'Inflation')
title(subplot(3,3,6),'Real interest rate')
title(subplot(3,3,7),'Output')
title(subplot(3,3,8),'Output gap')

lgd=legend('1959Q1--2007Q3','1984Q1--2007Q3','1959Q1--2019Q4','90% conf. band','Location','none','Position', [0.715 0.14 0.17 0.15]);

%%