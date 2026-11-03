%%% FLEX-PRICE MODEL

lambda_n        = (kappa/gzbar)/(1-kappa/gzbar)*cItilde_n(-1) - (1/(1-kappa/gzbar))*cItilde_n
                - (kappa/gzbar)/(1-kappa/gzbar)*gz_n - tauCbar/(1+tauCbar)*tauC_n + 1/nuG*(cItilde_n - cI_n) + epsilonC_n;

0            =   Q_n + (gammaI*gzbar^2*(1+betta))*epsilonI_n
                  + gammaI*gzbar^2*(  betta*(  i_n(+1) - i_n) - (  i_n - i_n(-1) ) + betta*gz_n(+1)  - gz_n);

Q_n             =   betta*(1-delta)*epsRPKbar/gzbar*Q_n(+1) + lambda_n(+1) - lambda_n - gz_n(+1)
                  - betta*(1-tauKbar)*rKbar/gzbar*epsRPKbar*(  1/(1-tauKbar)*tauK_n(+1) - rK_n(+1) - u_n(+1))
                  + betta*delta/gzbar*epsRPKbar*( tauK_n(+1));

lambda_n        =   lambda_n(+1) - gz_n(+1) + (rrp_n);

k_n             =   (1-delta)/gzbar*k_n(-1) - (1-delta)/gzbar*gz_n
                          + (1-(1-delta)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI_n
                          + (1-(1-delta)/gzbar)*i_n;

rK_n             =   gammau2/gammau1*u_n ;

kS_n             =    u_n   +   k_n(-1);

w_n - (1/(1-tauNbar))*(tauN_n) = (sigmaL*(N_n + epsilonN_n) - lambda_n) ;

y_n             =   (1+psi/ybar)*(  epsilon_n + alfa*(ktilde_n - gz_n) + (1-alfa)*N_n );

rK_n            =   gz_n + N_n +  w_n  - kS_n
                        - (nuK-1)/nuK*( ((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^((nuK-1)/nuK ) )/
                        ( 1+((1-alphaK)/alphaK )^(1/nuK)*(kGbar/kbar)^( (nuK-1)/nuK ) )*( kG_n(-1)-kS_n );

y_n             =   hbar/ybar*(hCbar/hbar*(c_n ) + hIbar/hbar*(i_n ) + hGbar/hbar*g_n + hIGbar/hbar*iG_n);

y_n        =   cbar/(ybar)*( c_n ) + ibar/(ybar)*( i_n) + kbar/(gzbar*ybar)*gammau1*u_n
                          + gbar/(ybar)*( g_n) + iGbar/(ybar)*( iG_n);

gbar/(ybar)*( g_n - y_n) = cbar/(ybar)*(tauC_n + tauCbar*(c_n - y_n))
    + wbar*Nbar/(ybar)*(tauN_n + tauNbar*(w_n + N_n - y_n))
    - iGbar/(ybar)*(iG_n - y_n)
    + rKbar*kbar/(gzbar*(ybar))*(tauK_n + tauKbar*(u_n + rK_n + k_n(-1) - gz_n - y_n))
    - kbar/(gzbar*(ybar))*(delta*tauK_n + tauKbar*gammau1*u_n + tauKbar*delta*(k_n(-1) - gz_n - y_n))
    + bbar/(Rgovbar*(ybar))*(b_n - rrp_n - y_n)
    - bbar/(gzbar*(ybar))*(b_n(-1) - gz_n - y_n)
    - trbar/(ybar)*(tr_n - y_n);

(pbudsus_n - y_n) = (rrp_n - (dy_n ) + b_n(-1) - y_n(-1));
susgap_n = pbud_n - pbudsus_n;
susgapgdp_n = (pbud_n - pbudsus_n) - y_n;

pbud_n = cbar/(ybar)*(tauC_n + tauCbar*(c_n - y_n))
          + wbar*Nbar/(ybar)*(tauN_n + tauNbar*(w_n + N_n - y_n))
          + rKbar*kbar/(gzbar*(ybar))*(tauK_n + tauKbar*(u_n + rK_n + k_n(-1) - gz_n - y_n))
          - gbar/(ybar)*( g_n - y_n)
          - iGbar/(ybar)*( iG_n - y_n)
          - kbar/(gzbar*(ybar))*(delta*tauK_n + tauKbar*gammau1*u_n + tauKbar*delta*(k_n(-1) - gz_n - y_n))
          - trbar/(ybar)*(tr_n - y_n);

fiscalr_n = dy_n + 0.25*((pbud_n - y_n) - (b_n(-1) - y_n(-1)));
fiscalrrpgap_n = rrp_n - fiscalr_n;
fiscalrgap_n = r_n - fiscalr_n;

cItilde_n = alphaG^(1/nuG)*(cIbar/cItildebar)^((nuG-1)/nuG)*cI_n
            + (1-alphaG)^(1/nuG)*(gbar/cItildebar)^((nuG-1)/nuG)*g_n;

ktilde_n = alphaK^(1/nuK)*(kbar/ktildebar)^((nuK-1)/nuK)*kS_n
           + (1-alphaK)^(1/nuK)*(kGbar/ktildebar)^((nuK-1)/nuK)*kG_n(-1);

kG_n = (1-deltaG)/gzbar*kG_n(-1) - (1-deltaG)/gzbar*gz_n
        + (1-(1-deltaG)/gzbar)*iG_n
        + (1-(1-deltaG)/gzbar)*(gammaI*gzbar^2*(1+betta))*epsilonI_n;

c_n = (1-omega)*cIbar/cbar*cI_n + omega*cJbar/cbar*cJ_n;

tr_n = (1-omega)*trIbar/trbar*trI_n + omega*trJbar/trbar*trJ_n;

tr2rot*trI_n = (1-tr2rot)*trJ_n;

0 = (1+tauCbar)*cJbar*(tauCbar/(1+tauCbar)*tauC_n + cJ_n)
    - (1-tauNbar)*wbar*Nbar*(w_n + N_n - (1/(1-tauNbar))*(tauN_n)) - trJbar*trJ_n;

epsilonC_n = rhoC*epsilonC_n(-1) + etaC;
epsilonN_n = rhoN*epsilonN_n(-1) + etaN;
epsilonRPG_n = rhoRPG*epsilonRPG_n(-1) + etaRPG;
epsilonRPstar_n = rhoRPstar*epsilonRPstar_n(-1) + etaRPstar;
gz_n = rhogz*gz_n(-1) + etagz;
epsilon_n = rhoepsilon*epsilon_n(-1) + etaepsilon;
epsilonI_n = rhoI*epsilonI_n(-1) + etaI;

g_n =  rhog*g_n(-1) -  thetaGY*y_n  -  thetaGB*b_n(-1)  + epsilonG_n;
iG_n =  rhoiG*iG_n(-1) -  thetaiGY*y_n -  thetaiGB*b_n(-1) + epsiloniG_n;
tr_n =  rhotr*tr_n(-1) - thetatrY*y_n  -  thetatrB*b_n(-1) + epsilontr_n;

tauC_n = rhotauC*tauC_n(-1) + thetatauCB*b_n(-1) + thetatauCY*y_n + epsilontauC_n;
tauN_n = rhotauN*tauN_n(-1) + thetatauNB*b_n(-1) + thetatauNY*y_n + epsilontauN_n;
tauK_n = rhotauK*tauK_n(-1) + thetatauKB*b_n(-1) + thetatauKY*y_n + epsilontauK_n;

epsilonG_n = rhoepsG*epsilonG_n(-1) + etag;
epsiloniG_n = rhoepsiG*epsiloniG_n(-1) + etaiG;
epsilontr_n = rhoepstr*epsilontr_n(-1) + etatr;
epsilontauC_n = rhoepstauC*epsilontauC_n(-1) + etatauC;
epsilontauN_n = rhoepstauN*epsilontauN_n(-1) + etatauN;
epsilontauK_n = rhoepstauK*epsilontauK_n(-1) + etatauK;


N_n + epsilonN_n = E_n + (xiE/((1 - betta*xiE)*(1 - xiE)))*((E_n - E_n(-1)) + betta*(E_n - E_n(+1)));

dy_n = y_n - y_n(-1);
rrp_n = r_n + epsilonRPG_n + gammaB*(b_n - y_n);
by_n = b_n - y_n;

%% Flex-price Open Economy has NO impact
ystar_n = (1 + sigmastarn)/(sigmastar + sigmastarn)*epsilonYstar_n;

ystar_n = (1/(1 + kappastar))*ystar_n(+1) + (kappastar/(1 + kappastar))*(ystar_n(-1))
          - ((1 - kappastar)/(sigmastar*(1 + kappastar)))*(rstar_n + epsilonRPstar_n);

epsilonYstar_n = rhoYstar*epsilonYstar_n(-1) + etaYstar;

d4y_n = dy_n + dy_n(-1) + dy_n(-2) + dy_n(-3);
