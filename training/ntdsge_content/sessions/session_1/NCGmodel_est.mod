var c k lab z;
varexo e;

parameters bet del alp rho the tau s;
bet = 0.987;
the = 0.357;
del = 0.012;
alp = 0.4;
tau = 2;
rho = 0.95;
s = 0.007;

model;
(c^the*(1-lab)^(1-the))^(1-tau)/c=bet*((c(+1)^the*(1-lab(+1))^(1-the))^(1-tau)/c(+1))
*(1+alp*exp(z(-1))*k(-1)^(alp-1)*lab^(1-alp)-del);
c=the/(1-the)*(1-alp)*exp(z(-1))*k(-1)^alp*lab^(-alp)*(1-lab);
k=exp(z(-1))*k(-1)^alp*lab*(1-alp)-c+(1-del)*k(-1);
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

% use_calibration;

estimated_params;
%stderr e,inv_gamma_pdf, 0.5,inf;
%rho,beta_pdf,0.9,0.05;
%the,normal_pdf,0.3,0.1;
%tau,normal_pdf,2,0.1;
stderr e,inv_gamma_pdf, 0.95,inf;
rho,beta_pdf,0.93,0.02;
the,normal_pdf,0.3,0.05;
tau,normal_pdf,2.1,0.3;
end;

varobs z;

estimation(datafile=simudata,mh_replic=10000, mh_jscale=0.9); % , mode_compute=4 , mode_compute=5
