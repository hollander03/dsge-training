
% Clear workspace
clear; close all; clc;

% Define filenames and values
mod_file = 'basicNKMtidy'; % Ensure this is the correct .mod file name
shock_label = 'epsilon_z';
shock_title = 'Technology Shock';

% Define IRF variables and plot titles
vars_to_plot = {'y', 'ygap', 'r', 'rn', 'int', 'pii', 'p', 'xi_z'};
plot_titles = {'Output', 'Output gap', 'Real interest rate', ...
               'Natural interest rate', 'Nominal interest rate', ...
               'Inflation', 'Price level', 'Technology shock'};

scale_400 = ismember(vars_to_plot, {'r', 'rn', 'int', 'pii'});
n_vars = length(vars_to_plot);
irf_horizon = 40;

% Create container for both IRFs
IRFs = struct();

% Define two policy settings
rho_i_vals = [0.75, 0];
labels = {'\rho_i = 0.75', '\rho_i = 0'};

for i = 1:2
    rho_val = rho_i_vals(i);
    set_param = sprintf("rho_i = %.2f;", rho_val);
    fid = fopen("rho_set.mod", "w");
    fprintf(fid, "%s\n", set_param);
    fclose(fid);

    system("dynare mod_file -noclearall");
    for v = 1:n_vars
        varname = vars_to_plot{v};
        irf_name = sprintf('%s_%s', varname, shock_label);
        if isfield(oo_.irfs, irf_name)
            series = oo_.irfs.irf_name;
            IRFs(i).(varname) = series(:);
        else
            IRFs(i).(varname) = nan(irf_horizon, 1);
        end
    end
end

% Plot results
figure('Name', ['IRFs to ', shock_title]);
for v = 1:n_vars
    subplot(3, 3, v);
    hold on;
    for i = 1:2
        series = IRFs(i).(vars_to_plot{v});
        if scale_400(v)
            series = 400 * series;
        else
            series = 100 * series;
        end
        plot(0:irf_horizon, [0; series(1:irf_horizon)], 'LineWidth', 1.5);
    end
    hold off;
    title(plot_titles{v});
    xlabel('Quarters');
    grid on;
    if v == 3
        legend(labels, 'Location', 'southwest');
    end
end
