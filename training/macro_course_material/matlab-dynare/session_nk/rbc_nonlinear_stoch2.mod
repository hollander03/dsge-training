@#include "rbc_nonlinear_common1.inc"
steady;
check;

% -------------------------------- %
% Unexpected TFP shock             %
% Unexpected discount factor shock %
% -------------------------------- %

shocks;
var epsa = 0.04^2;
var epsz = 0.01^2;
end;

stoch_simul(order=1,irf=20) y c iv a r fk l fl z; %% ,periods=300
