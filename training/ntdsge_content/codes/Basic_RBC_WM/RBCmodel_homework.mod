@#define LOGUTILITY = 1

var
  y     ${Y}$        (long_name='output')
  c     ${C}$        (long_name='consumption')
  k     ${K}$        (long_name='capital')
  l     ${L}$        (long_name='labor')
  a     ${A}$        (long_name='productivity')
  r     ${R}$        (long_name='interest Rate')
  w     ${W}$        (long_name='wage')
  iv    ${I}$        (long_name='investment')
  mc    ${MC}$       (long_name='marginal Costs')
;

%model_local_variable
%  uc    ${U_t^C}$
%  ucp   ${E_t U_{t+1}^C}$
%  ul    ${U_t^L}$
%  fk    ${f_t^K}$
%  fl    ${f_t^L}$



varexo
  epsa  ${\varepsilon^A}$   (long_name='Productivity Shock')
;

parameters
  BETA  ${\beta}$  (long_name='Discount Factor')
  DELTA ${\delta}$ (long_name='Depreciation Rate')
  GAMMA ${\gamma}$ (long_name='Consumption Utility Weight')
  PSI   ${\psi}$   (long_name='Labor Disutility Weight')
  @#if LOGUTILITY == 0
  ETAC  ${\eta^C}$ (long_name='Risk Aversion')
  ETAL  ${\eta^L}$ (long_name='Inverse Frisch Elasticity')
  @#endif
  ALPHA ${\alpha}$ (long_name='Output Elasticity of Capital')
  RHOA  ${\rho^A}$ (long_name='TFP persistence')
  sigmae
;

% Parameter calibration
ALPHA = 0.35;
BETA  = 0.99;
DELTA = 0.025;
GAMMA = 1;
PSI   = 1.6;
RHOA  = 0.9;
@#if LOGUTILITY == 0
ETAC  = 2;
ETAL  = 1;
@#endif
sigmae = 1;

model;
%marginal utility of consumption and labor
@#if LOGUTILITY == 1
  #uc  = GAMMA*c^(-1);
  #ucp  = GAMMA*c(+1)^(-1);
  #ul = -PSI*(1-l)^(-1);
@#else
  #uc  = GAMMA*c^(-ETAC);
  #ucp  = GAMMA*c(+1)^(-ETAC);
  #ul = -PSI*(1-l)^(-ETAL);
@#endif

%marginal products of production
#fk = ALPHA*y/k(-1);
#fl = (1-ALPHA)*y/l;

% intertemporal optimality (Euler)
uc = BETA*ucp*(1-DELTA + r(+1)) ; %% + eps_b // add on RHS for an example "preference shock" // check changing r(+1) to r
% labor supply
w = -ul/uc; %% l1  = - (1/ETAL)*w1 + (ETAC/ETAL)*c1
% capital accumulation
k = (1-DELTA)*k(-1) + iv;
% market clearing
y = c + iv ;                    %% + eps_g // add on RHS for an example "government spending shock"
% production function
y = a*k(-1)^ALPHA*l^(1-ALPHA);
% marginal costs
mc = 1;
% labor demand
w = mc*fl;
% capital demand
r = mc*fk;
% total factor productivity
log(a) = RHOA*log(a(-1)) + epsa;
end;

%-------------------------------------------- %
% Steady State Computation (Homework Exercise)%
%-------------------------------------------- %

initval; 
 a = 1;     % TFP level normalised to one            %
 mc = 1;    % perfect competition                    %
 r = 0.03;  % interest rate for RBC models           %  
 l = 1/3;   % steady state labour work 8 hours a day %
 y = 1.2;   % steady state output usually above one  %
 c = 0.9;   % market clearing y = c + i              %
 iv = 0.35; % does not necessarily need to add up    %  
 k = 12;    % capital is ten times output            %
 w = 2.25;  
end;

shocks;
var epsa = sigmae^2;  // stderr 0.01; // var(sigmae) = 0.01^2
end;

resid;
steady;     % dynare compute steady state %
check;

stoch_simul(order=1, periods=150); // , nograph , nodisplay , periods=150

%----------------------------------------------------------------
% Plot IRFs to a 1.0% s.d. technology shock
%----------------------------------------------------------------

figure
plot([0:options_.irf], [0 oo_.irfs.y_epsa])
hold
plot([0:options_.irf], [0 oo_.irfs.c_epsa])
plot([0:options_.irf], [0 oo_.irfs.k_epsa])
plot([0:options_.irf], [0 oo_.irfs.l_epsa])
plot([0:options_.irf], [0 oo_.irfs.a_epsa])
plot([0:options_.irf], [0 oo_.irfs.r_epsa])
plot([0:options_.irf], [0 oo_.irfs.w_epsa])
plot([0:options_.irf], [0 oo_.irfs.iv_epsa])
plot([0:options_.irf], [0 oo_.irfs.mc_epsa])
title('Impulse responses to a technology shock')
legend('Output','Consumption','Capital','Employment','Technology shock', 'Rate of return','wage','Investment','mc')
ylabel('percentage deviations from steady state')
xlabel('quarters after shock')


write_latex_definitions;
write_latex_parameter_table;
write_latex_original_model;
%write_latex_dynamic_model;
write_latex_static_model;
collect_latex_files;

%if system(['pdflatex -halt-on-error -interaction=batchmode ' M_.fname '_TeX_binder.tex'])
%    warning('TeX-File did not compile; you need to compile it manually')
%end
