function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(20)=y(14)-y(4);
  y(19)=y(12)-y(2);
  y(18)=y(11)-y(1)+params(7);
end
