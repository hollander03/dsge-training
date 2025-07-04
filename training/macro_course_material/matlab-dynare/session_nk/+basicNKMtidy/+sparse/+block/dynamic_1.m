function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(26)=params(9)*y(9)+x(1);
  y(27)=params(10)*y(10)+x(2);
  y(28)=params(12)*y(11)+x(3);
end
