function [y, T, residual, g1] = static_2(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  T(1)=exp(y(4));
  T(2)=y(2)^params(4);
  T(3)=y(3)^(-params(4));
  residual(1)=(y(1))-((1-y(3))*T(1)*(1-params(4))*params(2)/(1-params(2))*T(2)*T(3));
  T(4)=y(3)^(1-params(4));
  residual(2)=(y(2))-(T(4)*T(1)*T(2)-y(1)+y(2)*(1-params(3)));
  T(5)=y(1)^params(2);
  T(6)=(1-y(3))^(1-params(2));
  T(7)=T(5)*T(6);
  T(8)=T(7)^(1-params(5));
  T(9)=T(8)/y(1);
  T(10)=params(4)*T(1)*y(2)^(params(4)-1);
  T(11)=1+T(10)*T(4)-params(3);
  residual(3)=(T(9))-(T(9)*params(1)*T(11));
  T(12)=getPowerDeriv(T(7),1-params(5),1);
  T(13)=(y(1)*T(6)*getPowerDeriv(y(1),params(2),1)*T(12)-T(8))/(y(1)*y(1));
  T(14)=getPowerDeriv(y(2),params(4),1);
  T(15)=T(12)*T(5)*(-(getPowerDeriv(1-y(3),1-params(2),1)))/y(1);
  T(16)=getPowerDeriv(y(3),1-params(4),1);
if nargout > 3
    g1_v = NaN(9, 1);
g1_v(1)=(-((1-y(3))*T(3)*T(1)*(1-params(4))*params(2)/(1-params(2))*T(14)));
g1_v(2)=1-(1-params(3)+T(4)*T(1)*T(14));
g1_v(3)=(-(T(9)*params(1)*T(4)*params(4)*T(1)*getPowerDeriv(y(2),params(4)-1,1)));
g1_v(4)=(-((1-y(3))*T(1)*(1-params(4))*params(2)/(1-params(2))*T(2)*getPowerDeriv(y(3),(-params(4)),1)-T(1)*(1-params(4))*params(2)/(1-params(2))*T(2)*T(3)));
g1_v(5)=(-(T(1)*T(2)*T(16)));
g1_v(6)=T(15)-(T(11)*params(1)*T(15)+T(9)*params(1)*T(10)*T(16));
g1_v(7)=1;
g1_v(8)=1;
g1_v(9)=T(13)-T(11)*params(1)*T(13);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 3);
end
end
