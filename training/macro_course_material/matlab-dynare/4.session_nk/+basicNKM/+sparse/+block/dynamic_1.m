function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(23)=params(9)*y(9)+x(1);
  y(24)=params(10)*y(10)+x(2);
end
