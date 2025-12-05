
// ----------------------------------------------------------------------------
// Section 4 Replication — CLEAN exercises (k predetermined)
// Permanent & Once-off for each of: g, tau_c, tau_i, tau_k
// No macros; standard Dynare/Matlab only
// ----------------------------------------------------------------------------

// -----------------------------
// 1) Model (self-contained)
// -----------------------------
var y
    v
    c
    k
    q
    r
    w
    Rgross
    s
    %w_over_q
    %s_over_q
    %r_over_q
    %RBIG
    dy_
    dc_
    dtauC_
    dtauK_
    pref
    A
    g
    tau_c
    tau_i
    tau_k
    ;

varexo 
   eps_pref
   eps_A
   eps_g
   eps_tau_c
   eps_tau_i
   eps_tau_k
   ;

parameters betta delt alph gam y_ss c_ss tau_c_ss tau_k_ss omega_pref omega_A omega_g omega_tau_c omega_tau_i omega_tau_k;

betta  = 0.98;
delt = 0.025;
%A     = 1.0;
alph = 0.33;
gam = 2.0;
B     = 3.0;

y_ss = 0.576718094443233;
c_ss = 0.717246011324062; 
tau_c_ss = 0.014046065134452; 
tau_k_ss = 0.055724902506448;

omega_pref = 0.75;
omega_A = 0.75;
omega_g = 0.75;
omega_tau_c = 0.75;
omega_tau_i = 0;
omega_tau_k = 0.75;

model;
    // Resource constraint
    y = c + v + g;
    // Production function
    y = exp(A)*k(-1)^alph;
    // Capital stock
    k = v + (1 - delt)*k(-1);
    // Unnecessary
    q = 1;

    // Marginals with k(-1)
    r = q * exp(A) * alph * k(-1)^(alph - 1);
    w = q * ( exp(A) * k(-1)^alph - k(-1) * exp(A) * alph * k(-1)^(alph - 1) );

    // Return (Section 4 timing)
    Rgross = ((1 + tau_c(-1)) / (1 + tau_c)) * ( ((1 - tau_i) / (1 - tau_i(-1))) * (1 - delt)
        + ((1 - tau_k) / (1 - tau_i(-1))) * exp(A) * alph * k(-1)^(alph - 1) );

    // Saving return
    s = q * ( (1 - tau_k) * exp(A) * alph * k(-1)^(alph - 1) + (1 - delt) );

    // Euler
    c^(-gam) = exp(pref)*betta * c(+1)^(-gam) * Rgross ;

    // AR(1) shock processessesses
    pref = omega_pref*pref(-1) + eps_pref;
    A = omega_A*A(-1) + eps_A;
    g = omega_g*g(-1) + eps_g;
    tau_c = omega_tau_c*tau_c(-1) + eps_tau_c;
    tau_i = omega_tau_i*tau_i(-1) + eps_tau_i;
    tau_k = omega_tau_k*tau_k(-1) + eps_tau_k;


%%%% Observable variables

dy_/100 = y - y(-1) + y_ss/100;
dc_/100 = c - c(-1) + c_ss/100;

dtauC_/100 = tau_c + tau_c_ss/100;
dtauK_/100 =  tau_k + tau_k_ss/100;

end;

initval;
    g     = 0.2;
    tau_c = 0.0;
    tau_i = 0.0;
    tau_k = 0.0;

    k     = 10;
    c     = 0.6;
    y     = 1;
    v     = 1;
    q     = betta;
    r     = 0.01;
    w     = 0.5;
    Rgross     = 1/betta;
    s     = 1.0;

    %w_over_q = w/q;
    %s_over_q = s/q;
    %r_over_q = r/q;
    %RBIG     = Rgross;
end;

/*
endval;
    g     = 0.4;
    tau_c = 0.0;
    tau_i = 0.0;
    tau_k = 0.0;

    k     = 1.5;
    c     = 0.6;
    q     = betta;
    r     = 0.1;
    w     = 0.5;
    Rgross     = 1/betta;
    s     = 1.0;

    %w_over_q = w/q;
    %s_over_q = s/q;
    %r_over_q = r/q;
    %RBIG     = Rgross;
end;
*/

steady;
check;
resid;

shocks;
    
    var eps_pref;     stderr 0.01;
    var eps_A;     stderr 0.01;
    var eps_g;     stderr 0.01;
    var eps_tau_c; stderr 0.01;
    var eps_tau_i; stderr 0;
    var eps_tau_k; stderr 0.01;
end;

%stoch_simul(irf=40) y c v s k r Rgross w;

estimated_params;

betta, beta_pdf, 0.98, 0.0025; 
delt, beta_pdf, 0.025, 0.005;  
alph, beta_pdf, 0.33, 0.05;   
gam, gamma_pdf, 1, 0.5;

omega_pref, beta_pdf, 0.75, 0.01;
omega_A, beta_pdf, 0.75, 0.01;
omega_g, beta_pdf, 0.75, 0.01;
omega_tau_c, beta_pdf, 0.75, 0.01;
%omega_tau_i, beta_pdf, 0.75, 0.01;
omega_tau_k, beta_pdf, 0.75, 0.01;

stderr eps_pref, inv_gamma_pdf, 0.01, inf;
stderr eps_A, inv_gamma_pdf, 0.01, inf;
stderr eps_g, inv_gamma_pdf, 0.01, inf;
stderr eps_tau_c, inv_gamma_pdf, 0.01, inf;
%stderr eps_tau_i, inv_gamma_pdf, 0.01, inf;
stderr eps_tau_k, inv_gamma_pdf, 0.01, inf;

end ;

varobs dy_ dc_ dtauC_ dtauK_;


/* estimation( datafile = data_23q2_v3, 
            mh_replic = 100000, 
            mh_nblocks = 2, 
            mh_drop = 0.5, 
            mh_jscale = 0.625,
            mode_compute = 5, 
            mode_check, 
            plot_priors = 0,
            bayesian_irf, 
            irf = 40,
            conditional_variance_decomposition = [1:20] )
            y c v s k r Rgross w pref A g tau_c tau_i tau_k;
*/

estimation(datafile=data_23q2_v3, mh_replic=100000, mh_nblocks=2, mh_drop=0.5, mh_jscale=0.625,
           mode_compute=0, mode_check, plot_priors=0, // load_mh_file, //   graph_format=(fig) // 
           bayesian_irf, irf=40) y c v s k r Rgross w  pref A g tau_c tau_i tau_k; // moments_varendo, , conditional_variance_decomposition=[1:20]


shock_groups(name=groups);
'Technology' = eps_A;
'Preference' = eps_pref;  
'Government purchases' = eps_g;   
'Capital tax' = eps_tau_k;
'Cons tax' = eps_tau_c;
'Inv tax' = eps_tau_i;     
end;

/* --- Historical (shock) decomposition using estimated parameters --- */
/* Use the posterior mode (or posterior_mean) - requires estimation to have been run */
shock_decomposition(parameter_set = RMT_FP_final_est_ar_mode, use_shock_groups = groups) y;

/* Now plot it (options passed inside parentheses) */
/* graph_format = fig (no parentheses), steadystate is a flag, you can request write_xls if needed */
plot_shock_decomposition(graph_format = fig, use_shock_groups = groups, colormap = jet, steadystate) y c v s k r Rgross w pref A g tau_c tau_i tau_k;