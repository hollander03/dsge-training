@#define LOGUTILITY = 0

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
  z
  fk    ${f_t^K}$
  fl    ${f_t^L}$
;

%model_local_variable
%  uc    ${U_t^C}$
%  ucp   ${E_t U_{t+1}^C}$
%  ul    ${U_t^L}$
%  fk    ${f_t^K}$
%  fl    ${f_t^L}$
%;

varexo
  epsa  ${\varepsilon^A}$   (long_name='Productivity Shock')
  epsz
;

parameters
  BETA  ${\beta}$  (long_name='Discount Factor')
  DELTA ${\delta}$ (long_name='Depreciation Rate')
  GAMMA ${\gamma}$ (long_name='Consumption Utility Weight')
  PSI   ${\psi}$   (long_name='Labor Disutility Weight')
  @#if LOGUTILITY != 1
  ETAC  ${\eta^C}$ (long_name='Risk Aversion')
  ETAL  ${\eta^L}$ (long_name='Inverse Frisch Elasticity')
  @#endif
  ALPHA ${\alpha}$ (long_name='Output Elasticity of Capital')
  RHOA  ${\rho^A}$ (long_name='Discount Factor')
  RHOZ
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
RHOZ=0.5;


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
fk = ALPHA*y/k(-1);
fl = (1-ALPHA)*y/l;

[name='intertemporal optimality (Euler)']
uc = BETA*ucp*(1-DELTA+r(+1)) + (z - 1);
[name='labor supply']
w = -ul/uc;
[name='capital accumulation']
k = (1-DELTA)*k(-1) + iv;
[name='market clearing']
y = c + iv;
[name='production function']
y = a*k(-1)^ALPHA*l^(1-ALPHA);
[name='marginal costs']
mc = 1;
[name='labor demand']
w = mc*fl - (z - 1);
[name='capital demand']
r = mc*fk;
[name='total factor productivity']
log(a) = RHOA*log(a(-1)) + epsa;
log(z) = RHOZ*log(z(-1)) + epsz;
end;


% ------------------------ %
% Steady State Computation %
% ------------------------ %
steady_state_model;
z=1;
a = exp(epsa/(1-RHOA));
mc = 1;
r = 1/BETA + DELTA -1;
K_L = (mc*ALPHA*a/r)^(1/(1-ALPHA));
w = mc*(1-ALPHA)*a*K_L^ALPHA;
IV_L = DELTA*K_L;
Y_L = a*(K_L)^ALPHA;
C_L = Y_L - IV_L;
@#if LOGUTILITY==1
  l = GAMMA/PSI*C_L^(-1)*w/(1+GAMMA/PSI*C_L^(-1)*w);
@#else
  L0 = 1/3;
  l = rbc_steady_state_helper(L0, w,C_L,ETAC,ETAL,PSI,GAMMA);
@#endif
c  = C_L*l;
y  = Y_L*l;
iv = IV_L*l;
k  = K_L*l;

fk = ALPHA*Y_L/K_L;
fl = (1-ALPHA)*Y_L;

end;
