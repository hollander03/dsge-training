
% Script: plot_NK_IRFs.m
% Description: Generate IRF plots from a NK model with money-in-utility.
% IRFs stored in oo_.irfs as variable_shockname (e.g., ygap_epsilon_z)
close all;

shock_labels = {'epsilon_z', 'epsilon_p', 'epsilon_i'};
shock_names = {'Technology Shock', 'Cost-Push (Markup) Shock', 'Monetary Policy Shock'};
n_shocks = length(shock_labels);

% Define variables and titles (drop c, keep stored)
vars_to_plot = {'y', 'ygap', 'mreal', 'r', 'int', 'pii', 'mc', 'x'};
plot_titles = {'Output', 'Output gap', 'Real money supply', ...
               'Real interest rate', 'Nominal interest rate', 'Inflation', ...
               'Marginal cost', 'Markup'};
scale_400 = ismember(vars_to_plot, {'r', 'int', 'pii'}); % annualized rate variables
n_vars = length(vars_to_plot);

% Loop over shocks
for s = 1:n_shocks
    figure('Name', ['IRFs to ', shock_names{s}]);
    for v = 1:n_vars
        subplot(3, 3, v);
        series = eval(['oo_.irfs.', vars_to_plot{v}, '_', shock_labels{s}]);
        series = series(:);                     % ensure column vector
        T = min(20, length(series));            % protect against short IRFs
        % Scaling
        if scale_400(v)
            series = 400 * series(1:T);
        else
            series = 100 * series(1:T);
        end
        series = [0; series];                   % prepend 0
        plot(0:T, series, 'LineWidth', 1.5);
        title(plot_titles{v});
        if v > 6  % bottom row
            xlabel('Quarters');
        end
        if v <= 3 || v > 6
            ylabel('%-deviations');
        elseif v > 3 && v <= 6
            ylabel('%-points (ann.)');
        end
        grid on;
    end
    sgtitle(['Impulse Responses to ', shock_names{s}]);
end

% Combined MP Transmission Figure
figure('Name','IRFs: Monetary Transmission Mechanism');
hold on;

r_series     = 400 * oo_.irfs.r_epsilon_i(:);
ygap_series  = 100 * oo_.irfs.ygap_epsilon_i(:);
pii_series   = 400 * oo_.irfs.pii_epsilon_i(:);
int_series   = 400 * oo_.irfs.int_epsilon_i(:);

T = min([length(r_series), length(ygap_series), length(pii_series), length(int_series), 20]);

plot(0:T, [0; r_series(1:T)], 'k-o', 'DisplayName', 'Real interest rate');
plot(0:T, [0; ygap_series(1:T)], 'r--', 'DisplayName', 'Output gap');
plot(0:T, [0; pii_series(1:T)], 'b-s', 'DisplayName', 'Inflation');
plot(0:T, [0; int_series(1:T)], 'm-d', 'DisplayName', 'Nominal interest rate');

legend('Location','Northeast');
xlabel('Quarters');
ylabel('%-points (ann.)');
title('Monetary Transmission Mechanism');
grid on;
hold off;

% Export each figure as PNG
figHandles = findall(0, 'Type', 'figure');
for i = 1:length(figHandles)
    figure(figHandles(i));
    fname = get(figHandles(i), 'Name');
    if isempty(fname)
        fname = ['Figure_', num2str(i)];
    end
    fname_clean = regexprep(fname, '[^a-zA-Z0-9]', '_');
    exportgraphics(figHandles(i), [fname_clean, '.png'], 'Resolution', 300);
end
