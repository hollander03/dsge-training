% periods 1000;

var c k lab z;

varexo e;

parameters bet the del alp tau rho s;

bet = 0.987;
the = 0.357;
del = 0.012;
alp = 0.4;
tau = 2;
rho = 0.95;
s = 0.007;

model;
(c^the*(1-lab)^(1-the))^(1-tau)/c=bet*((c(+1)^the*(1-lab(+1))^(1-the))^(1-tau)/c(+1))*
(1+alp*exp(z(-1))*k(-1)^(alp-1)*lab^(1-alp)-del);
c=the/(1-the)*(1-alp)*exp(z(-1))*k(-1)^alp*lab^(-alp)*(1-lab);
k=exp(z(-1))*k(-1)^alp*lab^(1-alp)-c+(1-del)*k(-1);
z=rho*z(-1)+s*e;
end;

initval;
k = 1;
c = 1;
lab = 0.3;
z = 0;
e = 0;
end;

shocks;
var e;
stderr 1;
end;

steady;
check;

% NOTE:  dr_algo=[0,1] option no longer serves any purpose.
stoch_simul(periods=1000);  % order=2 

%datasaver('simudata',[]);

save simudata c k lab z %% Exercise ... fix the mod file ... tidy it up ... do applications from userguide and examples yesterday
