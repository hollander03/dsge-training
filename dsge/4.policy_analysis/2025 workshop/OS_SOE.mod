//--------------------------------------------------------------
// Small Open Economy DSGE Model – Ortiz & Sturzenegger (2007)
// Replication-ready Dynare .mod file
// Hylton Hollander – 2025
//--------------------------------------------------------------

// -------------------------------------------------------------
// 1. VARIABLES (with LaTeX names)
// -------------------------------------------------------------
var y        // $y_t$ output
    pi       // $\pi_t$ CPI inflation
    R        // $R_t$ nominal interest rate
    q        // $q_t$ terms of trade
    s        // $s_t$ nominal exchange rate
    y_f      // $y^*_t$ foreign output
    pi_f     // $\pi^*_t$ foreign inflation
    z        // $z_t$ world technology growth
    y_pot    // $y^{pot}_t$ flexible-price/potential output
    % y_obs
    ;   

varexo eps_R eps_q eps_yf eps_pif eps_z;

// -------------------------------------------------------------
// 2. PARAMETERS (with LaTeX names)
// -------------------------------------------------------------
parameters beta sigma alpha kappa rho_R psi_pi psi_y psi_s 
           rho_q rho_yf rho_pif rho_z 
           phi_q phi_yf chi_q chi_yf
           %y_ss
           ;

// -------------------------------------------------------------
// 3. CALIBRATION (Ortiz/Lubik–Schorfheide style)
// -------------------------------------------------------------
beta    = 0.99;      // discount factor
sigma   = 1.50;      // IS curve elasticity (1/tau)
alpha   = 0.30;      // import share in CPI
kappa   = 0.10;      // slope of NKPC

rho_R   = 0.70;      // interest rate smoothing
psi_pi  = 1.50;      // Taylor coefficient on inflation
psi_y   = 0.30;      // coefficient on output
psi_s   = 0.10;      // exchange-rate smoothing term

rho_q   = 0.40;      // persistence in terms-of-trade growth
rho_yf  = 0.80;      // persistence of foreign output
rho_pif = 0.60;      // persistence of foreign inflation
rho_z   = 0.40;      // world technology persistence

// Output and ToT elasticities in IS curve
phi_q   = 0.05;      // effect of expected ToT growth
phi_yf  = 0.05;      // effect of foreign output growth

// Potential output coefficients (flex-price solution)
chi_q   = -0.10;     // loading of ToT on y_pot
chi_yf  = 0.20;      // loading of y_f on y_pot
%y_ss    = 0.006;


// -------------------------------------------------------------
// 4. MODEL BLOCK
// -------------------------------------------------------------
model(linear);

// -----------------------------------------------------------
// (1) Open-Economy IS Curve
// y = E[y(+1)] - sigma[(R - E[pi(+1)]) - rho_z*z] 
//                 + phi_q*(Δq_{t+1}) + phi_yf*(Δy*_t+1)
// -----------------------------------------------------------
y = y(+1)
    - sigma*( R - pi(+1) - rho_z*z )
    + phi_q*( q(+1) - q )
    + phi_yf*( y_f(+1) - y_f );

// -----------------------------------------------------------
// (2) Phillips Curve (NKPC, open-economy extension)
// pi = beta*E[pi(+1)] + alpha*beta*(Δq_{t+1}) + kappa*(y - y_pot)
// -----------------------------------------------------------
pi = beta*pi(+1)
     + alpha*beta*( q(+1) - q )
     + kappa*( y - y_pot );

// -----------------------------------------------------------
// (3) Monetary Policy Rule (Taylor + ER term)
// R = rho_R*R(-1) + (1-rho_R)*( psi_pi*pi + psi_y*y + psi_s*Δs ) + eps_R
// -----------------------------------------------------------
R = rho_R*R(-1)
    + (1-rho_R)*( psi_pi*pi + psi_y*y + psi_s*( s - s(-1) ) )
    + eps_R;

// -----------------------------------------------------------
// (4) CPI identity linking domestic inflation, foreign inflation,
//     terms of trade, and exchange rate
// pi = alpha*pi_f + (1-alpha)*Δs + Δq
// -----------------------------------------------------------
pi = alpha*pi_f
      + (1-alpha)*( s - s(-1) )
      + ( q - q(-1) );

// -----------------------------------------------------------
// (5) Terms of Trade AR(1) in differences
// Δq_t = rho_q*Δq_{t-1} + eps_q
// -----------------------------------------------------------
(q - q(-1)) = rho_q*( q(-1) - q(-2) ) + eps_q;

// -----------------------------------------------------------
// (6) Foreign Output
// y_f = rho_yf*y_f(-1) + eps_yf
// -----------------------------------------------------------
y_f = rho_yf*y_f(-1) + eps_yf;

// -----------------------------------------------------------
// (7) Foreign Inflation
// pi_f = rho_pif*pi_f(-1) + eps_pif
// -----------------------------------------------------------
pi_f = rho_pif*pi_f(-1) + eps_pif;

// -----------------------------------------------------------
// (8) World Technology
// z = rho_z*z(-1) + eps_z
// -----------------------------------------------------------
z = rho_z*z(-1) + eps_z;

// -----------------------------------------------------------
// (9) Potential Output
// y_pot = chi_yf*y_f + chi_q*q
// -----------------------------------------------------------
y_pot = chi_yf*y_f + chi_q*q;

// -----------------------------------------------------------
// (10) measurement equations
// 
// -----------------------------------------------------------

% y_obs = y - y(-1) + y_ss;


end;


// -------------------------------------------------------------
// 5. SHOCKS
// -------------------------------------------------------------
shocks;
    var eps_R;   stderr 0.10;
    var eps_q;   stderr 0.05;
    var eps_yf;  stderr 0.05;
    var eps_pif; stderr 0.05;
    var eps_z;   stderr 0.05;
end;


// -------------------------------------------------------------
// 6. CHECK & SIMULATE (for testing only)
// -------------------------------------------------------------

steady;
check;


stoch_simul(order=1, irf=20);


// -------------------------------------------------------------
// 7. ESTIMATION (COMMENTED OUT FOR NOW)
// -------------------------------------------------------------
/*
estimated_params;

// Example priors (Lubik–Schorfheide style)
rho_R,   beta_pdf, 0.7, 0.1;
psi_pi,  normal_pdf, 1.5, 0.3;
psi_y,   normal_pdf, 0.3, 0.1;
psi_s,   normal_pdf, 0.1, 0.05;

rho_yf,  beta_pdf, 0.8, 0.1;
rho_pif, beta_pdf, 0.6, 0.1;
rho_q,   beta_pdf, 0.4, 0.1;

stderr eps_R,   inv_gamma_pdf, 0.1, 2;
stderr eps_q,   inv_gamma_pdf, 0.05, 2;
stderr eps_yf,  inv_gamma_pdf, 0.05, 2;
stderr eps_pif, inv_gamma_pdf, 0.05, 2;
stderr eps_z,   inv_gamma_pdf, 0.05, 2;

end;

// You only need: datafile = my_SA_data; 
// Then:
estimation(datafile=mydata, mh_replic=20000, mh_nblocks=2, mh_jscale=0.5); % first_obs=1, nobs=120, 
*/