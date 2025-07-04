
% Script: plot_NK_IRFs.m
% Description: This script generates impulse response plots from a basic New Keynesian model
% with money in utility and labour-only production. It plots three figures (tech, MP, inflation shocks)
% and one combined figure for the monetary policy transmission mechanism.

% Assumed IRF data must be in the workspace:
% Variables: y, m, r, int, pii, mc, x, xi_z, xi_p, ygap
% Shocks: MP (epsilon_i), Tech (epsilon_z), Inflation/markup (epsilon_p)

% ------------ Figure 1: Combined IRFs for Monetary Policy Transmission ------------

figure('Name','Figure: IRFs to Monetary Policy Shock - Transmission Mechanism');
hold on;
plot(0:10, r(1:11), 'k-o', 'DisplayName', 'Real interest rate');
plot(0:10, ygap(1:11), 'r--', 'DisplayName', 'Output gap');
plot(0:10, pii(1:11), 'b-s', 'DisplayName', 'inflation');
plot(0:10, int(1:11), 'm-d', 'DisplayName', 'Nominal interest rate');
legend('Location','NorthEast');
xlabel('Quarters');
title('Monetary Transmission Mechanism');
grid on;
hold off;

% ------------ Figure 2: Technology Shock ------------

figure('Name','Figure: IRFs to Technology Shock');

subplot(3,3,1); plot(output_z); title('output');
subplot(3,3,2); plot(m_z); title('m');
subplot(3,3,3); plot(r_z); title('r');

subplot(3,3,4); plot(int_z); title('int');
subplot(3,3,5); plot(pii_z); title('pii');
subplot(3,3,6); plot(mc_z); title('mc');

subplot(3,3,7); plot(x_z); title('x');
subplot(3,3,8); plot(xi_z); title('xi\_z');
subplot(3,3,9); axis off;

% ------------ Figure 3: Monetary Policy Shock ------------

figure('Name','Figure: IRFs to Monetary Policy Shock');

subplot(3,3,1); plot(y_i); title('y');
subplot(3,3,2); plot(m_i); title('m');
subplot(3,3,3); plot(r_i); title('r');

subplot(3,3,4); plot(int_i); title('int');
subplot(3,3,5); plot(pii_i); title('pii');
subplot(3,3,6); plot(mc_i); title('mc');

subplot(3,3,7); plot(x_i); title('x');
subplot(3,3,8); axis off;
subplot(3,3,9); axis off;

% ------------ Figure 4: Inflation (Markup) Shock ------------

figure('Name','Figure: IRFs to Inflation (Markup) Shock');

subplot(3,3,1); plot(y_p); title('y');
subplot(3,3,2); plot(m_p); title('m');
subplot(3,3,3); plot(r_p); title('r');

subplot(3,3,4); plot(int_p); title('int');
subplot(3,3,5); plot(pii_p); title('pii');
subplot(3,3,6); plot(mc_p); title('mc');

subplot(3,3,7); plot(x_p); title('x');
subplot(3,3,8); plot(xi_p); title('xi\_p');
subplot(3,3,9); axis off;

sgtitle('IRFs to Price Markup Shock');

