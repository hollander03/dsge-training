function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(19)=params(4)*y(7)+x(1);
  y(23)=params(5)*y(11)+x(2);
  y(24)=params(6)*y(12)+x(3);
end
