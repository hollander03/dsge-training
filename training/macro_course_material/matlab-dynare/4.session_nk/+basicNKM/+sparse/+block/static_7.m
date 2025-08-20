function [y, T] = static_7(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(3)=y(2)*params(3)/params(4)-y(5)*params(1)*1/params(4);
  y(8)=(-y(7));
end
