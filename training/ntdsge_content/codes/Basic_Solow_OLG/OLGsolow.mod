// solow growth model

var y c k a r s;

varexo e;

parameters alpha rho;

alpha = 0.33;
rho = 0.95;
sigmae = 0.01;

model;

y = a + alpha*k;                       // production function with labour normalized

r = a + (1-alpha)*k;             // 

s = a + (alpha)*k;             // 

c = a + (alpha)*k;             //   

c(+1) = r + s;

a = rho*a(-1) + e;               // AR(1) Technology stochastic process

end;

shocks;
var e = sigmae^2;
end;

steady;

stoch_simul(order = 1, irf = 40);