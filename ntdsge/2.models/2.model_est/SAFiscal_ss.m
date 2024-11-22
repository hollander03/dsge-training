%compute steady state of core nonlinear equations
function out_ss = SAFiscal_ss(betta, sigmaL, kappa, gz, alpha, varphiH, varphiW, muC, muI, sI, sG, sIMC, ...
    sIMI, sX, pIM, sIG, nuG, alphaG, nuK, alphaK,...
    sC,sTR,omega,cJcISSratio,tauCrevYbar_target,tauNrevYbar_target,tauKrevYbar_target,...
    corp_gov_spread,pibar,epsRPK,given_alphaG,given_alphaK,alphaG_target,alphaK_target)


% choose intitial values and set steady state indicator
persistent y0 good_steady options

% steady state indicator
if isempty(good_steady)==1
    good_steady=0;
end

%initial guess
if isempty(y0)==1 || good_steady==0
    y0 = [log(45);               % k    %transformed on real line, para>0
        log( 2.5);               % c
        log( 2.5);               % N
        log( 1.00);              % pI
        log( 0.90);              % psi
        log( 0.80/(1-0.80));     % nuC  %transformed on real line, 0<=para<=1
        log( 0.70/(1-0.70));     % nuI
        0.2;                     % tauK -- original: 0.2
        log(10);                 % kG    %transformed on real line, para>0
        log( 0.0125/(1-0.0125)); % deltaG
        log( 0.0125/(1-0.0125)); % delta
        0.2;                     % tauN -- original: 0.2
        log(1.30);              % cJ -- original: log( 0.30)
        log(1.30);              % cI -- original: log( 0.30)
        log(1.30);                     % trJ -- logged - prevent negative val - previous 0.3 // CHECK: needed for BIG model counterfactuals log(1.10)
        log(1.30);                     % trI -- previous 0.3 // needed for BIG model counterfactuals log(1.10)
        0.2;                     % tauC -- original: 0.2
        log( 0.8/(1-0.8));       % alphaK
        log( 0.8/(1-0.8));       % alphaG
        0];
    
    % set options
    options = optimset('TolX'       ,  1e-7, ...   % accuracy for y
        'TolFun'     ,  1e-7, ...   % accuracy for ss_equations
        'TolCon'     ,  1e-7, ...   % accuracy for ss_constraint
        'MaxIter'    ,   5000, ...   % max. number of iterations
        'MaxFunEvals',  50000, ...   % max. number of function evaluations
        'Display'    , 'off');      % screen messages
end

% solve for steady-state values and calibrated parameters
[y,fval,exitflag,output] = fsolve('SAFiscal_ss_equations',y0,options,...
    betta, sigmaL, kappa, gz, alpha, varphiH, varphiW, muC, muI, sI, sG,...
    sIMC , sIMI, sX, pIM, sIG, nuG, alphaG,...
    nuK, alphaK,...
    sC,sTR,omega,cJcISSratio,tauCrevYbar_target,tauNrevYbar_target,tauKrevYbar_target,...
    corp_gov_spread,pibar,epsRPK,given_alphaG,given_alphaK,alphaG_target,alphaK_target);

if exitflag~=1 || isreal(y)~=1, %try again
    disp('Bad Steady State! Trying again');
    
    y0 = [log(45);               % k    %transformed on real line, para>0
        log( 2.5);              % c
        log( 2.5);              % N
        log( 1.00);              % pI
        log( 0.90);              % psi
        log( 0.80/(1-0.80));     % nuC  %transformed on real line, 0<=para<=1
        log( 0.70/(1-0.70));     % nuI
        0.2;                    % tauK
        log(10);                  % kG    %transformed on real line, para>0
        log( 0.01/(1-0.01)); % deltaG
        log( 0.015/(1-0.015)); % delta
        0.2;                     % tauN
        log(0.30);              % cJ -- original: log( 0.30)
        log(0.30);              % cI -- original: log( 0.30)
        log(1.30);                    % trJ -- logged - prevent negative val - previous 0.3 // needed for BIG model counterfactuals log(1.10)
        log(1.30);                    % trI -- previous 0.3 // needed for BIG model counterfactuals log(1.10)
        0.2;                     % tauC
        log( 0.8/(1-0.8));       % alphaK
        log( 0.8/(1-0.8));       % alphaG
        0];
    
    [y,fval,exitflag,output] = fsolve('SAFiscal_ss_equations',y0,options,...
        betta, sigmaL, kappa, gz, alpha, varphiH, varphiW, muC, muI, sI, sG,...
        sIMC , sIMI, sX, pIM, sIG, nuG, alphaG,...
        nuK, alphaK, ...
        sC,sTR,omega,cJcISSratio,tauCrevYbar_target,tauNrevYbar_target,tauKrevYbar_target,...
        corp_gov_spread,pibar,epsRPK,given_alphaG,given_alphaK,alphaG_target,alphaK_target);
    
    if exitflag==1 && isreal(y)==1
        disp('Yeah! Found good steady state with clean initial guess!');
    end
end

%update initial guess
if exitflag==1 && isreal(y)==1
    y0=y;
    good_steady=1;
else
    clear y0;
    good_steady=0;
end

out_ss = [exp(y( 1));            % k
    exp(y( 2));                  % c
    exp(y( 3));                  % N
    exp(y( 4));                  % pI
    exp(y( 5));                  % psi
    exp(y( 6))/(1+exp(y( 6)));   % nuC
    exp(y( 7))/(1+exp(y( 7)));   % nuI
    y(8);                        % tauK
    exp(y( 9));                  % kG
    exp(y( 10))/(1+exp(y( 10))); % deltaG
    exp(y( 11))/(1+exp(y( 11))); % delta
    y(12);                       % tauN
    exp(y( 13));                 % cJ
    exp(y( 14));                 % cI
    exp(y(15));                       % trJ %% exp added because of log trans - prevent negative val // exp(y(15))
    exp(y(16));                       % trI %% exp added because of log trans - prevent negative val // exp(y(16))
    y(17);                       % tauC
    exp(y( 18))/(1+exp(y( 18))); % alphaK
    exp(y( 19))/(1+exp(y( 19))); % alphaG
    y(20)];


if exitflag~=1 || isreal(out_ss)~=1
    disp('Bad Steady State!');
    out_ss=1e6*ones(22,1);
    
end

if y(8)<0
    disp('Bad Steady State: tauk<0!');
    out_ss=1e6*ones(22,1);
end

if y(20)<0
    disp('Bad Steady State: spread<0!');
    out_ss=1e6*ones(22,1);
end



