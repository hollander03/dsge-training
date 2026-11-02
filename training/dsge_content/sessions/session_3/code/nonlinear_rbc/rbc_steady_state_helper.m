function l = rbc_steady_state_helper(L0, w,C_L,ETAC,ETAL,PSI,GAMMA)
    options = optimset('Display','off','TolX',1e-10,'TolFun',1e-10);
    l = fsolve(@(l) w*C_L^(-ETAC) - PSI/GAMMA*(1-l)^(-ETAL)*l^ETAC , L0,options);
end
