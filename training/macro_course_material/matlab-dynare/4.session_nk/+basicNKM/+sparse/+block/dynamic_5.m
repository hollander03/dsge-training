function [y, T, residual, g1] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(4, 1);
  y(15)=y(16);
  y(21)=y(15)*(params(3)+params(5))-(1+params(5))*y(23);
  y(28)=y(15)-y(25);
  residual(1)=(y(19))-(y(18)+y(34));
  residual(2)=(y(19))-(params(11)*y(5)+(1-params(11))*(y(20)*params(7)+params(8)*y(28))+x(3));
  residual(3)=(y(16))-(y(30)-1/params(3)*y(18));
  residual(4)=(y(20))-(y(24)+params(1)*y(34)+(1-params(6))*(1-params(6)*params(1))/params(6)*y(21));
if nargout > 3
    g1_v = NaN(13, 1);
g1_v(1)=(-params(11));
g1_v(2)=(-1);
g1_v(3)=1/params(3);
g1_v(4)=1;
g1_v(5)=1;
g1_v(6)=(-((1-params(11))*params(8)));
g1_v(7)=1;
g1_v(8)=(-((1-params(6))*(1-params(6)*params(1))/params(6)*(params(3)+params(5))));
g1_v(9)=(-((1-params(11))*params(7)));
g1_v(10)=1;
g1_v(11)=(-1);
g1_v(12)=(-1);
g1_v(13)=(-params(1));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 12);
end
end
