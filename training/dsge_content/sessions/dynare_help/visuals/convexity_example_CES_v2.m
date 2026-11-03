% Simple constant elasticity of substitution example:
% $$f(x_1,x_2) = (x_1^\rho+x_2^\rho)^{\frac{\theta}{\rho}$$
% Homogeneity/Returns to scale:
% Change level of inputs by scalar $t$:
% 
% $$f(tx_1,tx_2)=((tx_1)^\rho+(tx_2)^\rho)^{\frac{\theta}{\rho}}=t^\theta f(x_1,x_2)$$
% 
% Thus $f$ is homogenous of degree $\theta$
% 
% if 
%% 
% * $\theta = 1$ - homogenous of degree 1 = Constant returns to scale
% * $\theta >1$ - homogenous of degree greater than 1 = Increasing returns to 
% scale
% * $\theta <1$ - homogenous of degree less than 1 = Decreasing returns to scale
%% 
% Returns to scale refer to any ray (in the domain) from the origin. This example 
% focusses on $x_1 = x_2$ (the top edge of the "side view" below)
% Marginal rate of substitution and quasi-convexity/quasi-concavity
% (exemplified by "view from above")
% 
% if 
%% 
% * $\rho = 1$ mariginal rate of substitution is constant - perfect substitutes 
% - Isoquants are straight lines - function is both (weakly) quasi-concave and 
% quasi convex. $f()$ is a plane in 3D
% * $\rho < 1$ - mariginal rate of substitution is diminishing - less than perfect 
% substitutes - Isoquants are bowed to the origin - function is strictly quasi-concave 
% ("better-than-sets" are convex sets). $f()$ is a "mountain" in 3D
% * $\rho = 0$ - Cobb-Douglas function
% * $\rho \rightarrow -\infty $ - Perfect complements.
% * $\rho > 1$ - mariginal rate of substitution is increasing - Isoquants are 
% bowed away from the origin - function is strictly quasi-convex ("worse-than-sets" 
% are convex sets). $f()$ is a "funnel" in 3D
% Convexity/Concavity:
% If $\theta, \rho < 1$, the function is globally concave
% 
% If $\theta, \rho > 1$, the function is globally convex
% 
% If they are on different sides of 1, the function is globally neither convex 
% nor concave.
% 
% 

rho = 0.5; % select any value (including -Inf, but not Inf)
theta = 0.5;

n = 100;
[X1,X2] = meshgrid(linspace(0,4,n));

if isinf(rho) && rho<0
    Y = min(X1,X2).^theta;
elseif rho == 0
    Y = sqrt(X1.*X2).^theta;
else
    Y = (X1.^rho + X2.^rho).^(theta/rho);
end

% figure
% hold on
% surf(X1,X2,Y,'LineStyle','none')
% contour3(X1,X2,Y,'k')
% view(0,90)
% title('view from above')
% grid on
% 
% figure
% hold on
% surf(X1,X2,Y,'LineStyle','none')
% contour3(X1,X2,Y,'k')
% view(45,0)
% title('view from the "side", visualizing the ray from the origin')
% grid on

%% 
% Also pop out the figure and rotate in 3D
%% 
% quasi concave if:
% 
% $$f(\lambda x+(1-\lambda)y)\geq \min\{f(x),f(y)\}$$
% 
% I.e. if the _function evaluated at an average of two points (blue curve below)_ 
% is greater than the _smallest of values at the two points (green and red dots 
% below)_
% 
% concave if: 
% 
% $$f(\lambda x+(1-\lambda)y)\geq \lambda f(x)+(1-\lambda)f(y)$$
% 
% I.e. if the _function evaluated at an average of two points (blue curve below)_ 
% is greater than the _average value of the function evaluated at the two points 
% (cyan line below)_
% 
% 

% pick x and y in R2

% random selection
% x = rand(1,2)*4
% y = rand(1,2)*4

% on the same level set 
x = [0.5, 3.5]
y = [3.5,0.5]

% % % on ray from origin
% x = [0.5, 0.5]
% y = [3.5,3.5]

%%

lambda = linspace(0,1,100)';

average_x_y = lambda*x + (1 - lambda)*y;

f_x = CES(x,rho,theta);
f_y = CES(y,rho,theta);

f_average = CES(average_x_y,rho,theta);

average_f = lambda*f_x + (1 - lambda)*f_y;

figure
hold on
surf(X1,X2,Y,'LineStyle','none','FaceColor',[0.5, 0.5, 0.5],'FaceAlpha',0.7)
contour3(X1,X2,Y,[f_x,f_y],'k')
scatter3(x(1),x(2),f_x,'filled','o','MarkerFaceColor',[0.8,0,0])
scatter3(y(1),y(2),f_y,'filled','o','MarkerFaceColor',[0,0.6,0])
plot3(average_x_y(:,1),average_x_y(:,2),f_average,'b','LineWidth',2)
plot3(average_x_y(:,1),average_x_y(:,2),average_f,'c','LineWidth',2)

ax = gca;
ax.TickLabelInterpreter = 'latex';
ax.XTick = [0,x(1),y(1)];
ax.XTickLabel = {'$0$';'$x_1$';'$y_1$'};
[ax.YTick, sort_index] = sort([0,x(2),y(2)]);
ax.YTickLabel = {'$0$';'$x_2$';'$y_2$'};
ax.YTickLabel = ax.YTickLabel(sort_index);

if f_x == f_y
    ax.ZTick = [f_x];
    ax.ZTickLabel = {'$f(x) = f(y)$'};
else
    ax.ZTick = [f_x,f_y];
    ax.ZTickLabel = {'$f(x)$';'$f(y)$'};
end
view(29,14)
light("Style","local","Position",[-02 -20 20],"Color",[1,0.8,0.8]);
light("Style","local","Position",[-20 -02 20],"Color",[0.8,1,0.8]);
light("Style","local","Position",[02 20 -20],"Color",[0.8,0.8,1]);
light("Style","local","Position",[20 02 -20],"Color",[0.8,1,0.8]);
lighting gouraud
material metal
grid on
legend('','','$f(x)$','$f(y)$','$f(\lambda x+(1-\lambda)y)$','$\lambda f(x)+(1-\lambda)f(y)$','Interpreter','latex','Location','eastoutside','Box','off')
axis vis3d
set(gcf,"Position",[285,125,955,753])

%%
function f = CES(x,rho,theta)

if isinf(rho) && rho<0
    f = min(x(:,1),x(:,2)).^theta;
elseif rho == 0
    f = sqrt(x(:,1).*x(:,2)).^theta;
else
    f = (x(:,1).^rho + x(:,2).^rho).^(theta/rho);
end

end
%% 
%