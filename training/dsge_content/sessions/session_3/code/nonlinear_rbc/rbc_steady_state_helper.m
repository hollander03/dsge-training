function l = rbc_steady_state_helper(L0, w,C_L,ETAC,ETAL,PSI,GAMMA)
    % The steady-state block already determines w and C_L = c/l.
    % Substitute c = C_L*l into household labour supply, w = -ul/uc,
    % leaving one nonlinear equation for labour (leisure is 1-l).
    % fsolve finds its zero from L0; the result sets the scale of c,y,iv,k.
    % Used when LOGUTILITY=0; log utility has a direct formula in the include.
    % fsolve does not enforce 0<l<1 or check convergence here.
    % See README.md for the derivation and a bracketed fzero alternative.
    options = optimset('Display','off','TolX',1e-10,'TolFun',1e-10);
    l = fsolve(@(l) w*C_L^(-ETAC) - PSI/GAMMA*(1-l)^(-ETAL)*l^ETAC , L0,options);
end
