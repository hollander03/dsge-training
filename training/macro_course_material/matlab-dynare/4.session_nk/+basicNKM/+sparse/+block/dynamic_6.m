function [y, T] = dynamic_6(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(17)=y(16)*params(3)/params(4)-y(19)*params(1)*1/params(4);
  y(22)=(-y(21));
end
