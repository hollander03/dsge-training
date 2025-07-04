function [y, T] = dynamic_3(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(22)=y(16)-y(4)+params(11);
  y(21)=y(14)-y(2)+params(10);
  y(20)=y(13);
end
