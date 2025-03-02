function [ys_, params, info] = SGU_2003_steadystate2(ys_, exo_, params)
% Steady state generated by Dynare preprocessor
    info = 0;
    ys_(12)=log(params(12));
    ys_(9)=params(13);
    ys_(2)=log(((1-params(8))*(params(8)/(params(12)+params(5)))^(params(8)/(1-params(8))))^(1/(params(2)-1)));
    ys_(5)=log(exp(ys_(2))/((params(12)+params(5))/params(8))^(1/(1-params(8))));
    ys_(3)=log(exp(ys_(5))^params(8)*exp(ys_(2))^(1-params(8)));
    ys_(4)=log(params(5)*exp(ys_(5)));
    ys_(1)=log(exp(ys_(3))-exp(ys_(4))-params(12)*ys_(9));
    ys_(10)=1-(exp(ys_(4))+exp(ys_(1)))/exp(ys_(3));
    ys_(8)=((exp(ys_(1))-params(2)^(-1)*exp(ys_(2))^params(2))^(1-params(1))-1)/(1-params(1));
    params(6)=(-log(1/(1+params(12))))/log(1+exp(ys_(1))-params(2)^(-1)*exp(ys_(2))^params(2));
    ys_(13)=(1+exp(ys_(1))-params(2)^(-1)*exp(ys_(2))^params(2))^(-params(6));
    ys_(14)=log((-ys_(8))/(1-ys_(13)));
    ys_(7)=log((exp(ys_(1))-exp(ys_(2))^params(2)/params(2))^(-params(1))-exp(ys_(14))*(-params(6))*(1+exp(ys_(1))-params(2)^(-1)*exp(ys_(2))^params(2))^((-params(6))-1));
    ys_(6)=0;
    ys_(11)=0;
    % Auxiliary equations
    check_=0;
end
