function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  T(1)=exp(y(4));
  T(2)=y(7)^(1-params(4));
  T(3)=y(2)^params(4);
  residual(1)=(y(6))-(T(2)*T(1)*T(3)-y(5)+y(2)*(1-params(3)));
  T(4)=y(7)^(-params(4));
  residual(2)=(y(5))-((1-y(7))*T(1)*(1-params(4))*params(2)/(1-params(2))*T(3)*T(4));
  T(5)=y(5)^params(2);
  T(6)=(1-y(7))^(1-params(2));
  T(7)=T(5)*T(6);
  T(8)=T(7)^(1-params(5));
  T(9)=y(9)^params(2);
  T(10)=(1-y(11))^(1-params(2));
  T(11)=T(9)*T(10);
  T(12)=T(11)^(1-params(5));
  T(13)=params(1)*T(12)/y(9);
  T(14)=params(4)*T(1)*y(2)^(params(4)-1);
  residual(3)=(T(8)/y(5))-(T(13)*(1+T(14)*T(2)-params(3)));
  T(15)=getPowerDeriv(T(7),1-params(5),1);
  T(16)=getPowerDeriv(T(11),1-params(5),1);
  T(17)=getPowerDeriv(y(2),params(4),1);
  T(18)=getPowerDeriv(y(7),1-params(4),1);
if nargout > 3
    g1_v = NaN(12, 1);
g1_v(1)=(-(1-params(3)+T(2)*T(1)*T(17)));
g1_v(2)=(-((1-y(7))*T(4)*T(1)*(1-params(4))*params(2)/(1-params(2))*T(17)));
g1_v(3)=(-(T(13)*T(2)*params(4)*T(1)*getPowerDeriv(y(2),params(4)-1,1)));
g1_v(4)=1;
g1_v(5)=(-(T(1)*T(3)*T(18)));
g1_v(6)=(-((1-y(7))*T(1)*(1-params(4))*params(2)/(1-params(2))*T(3)*getPowerDeriv(y(7),(-params(4)),1)-T(1)*(1-params(4))*params(2)/(1-params(2))*T(3)*T(4)));
g1_v(7)=T(15)*T(5)*(-(getPowerDeriv(1-y(7),1-params(2),1)))/y(5)-T(13)*T(14)*T(18);
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=(y(5)*T(6)*getPowerDeriv(y(5),params(2),1)*T(15)-T(8))/(y(5)*y(5));
g1_v(11)=(-((1+T(14)*T(2)-params(3))*params(1)*T(16)*T(9)*(-(getPowerDeriv(1-y(11),1-params(2),1)))/y(9)));
g1_v(12)=(-((1+T(14)*T(2)-params(3))*params(1)*(y(9)*T(10)*getPowerDeriv(y(9),params(2),1)*T(16)-T(12))/(y(9)*y(9))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 9);
end
end
