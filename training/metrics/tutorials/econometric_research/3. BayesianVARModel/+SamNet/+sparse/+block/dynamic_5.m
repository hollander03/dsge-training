function [y, T] = dynamic_5(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(20)=y(23)+y(21)+y(22);
  y(33)=y(32)-y(31);
end
