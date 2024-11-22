function [y, T] = static_8(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(1)=y(4)+y(2)+y(3);
  y(14)=y(13)-y(12);
end
