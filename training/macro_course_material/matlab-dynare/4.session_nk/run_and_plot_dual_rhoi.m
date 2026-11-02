% Compare interest-rate smoothing after a technology shock (Dynare 6).
% Run from this folder with Dynare configured. No source files are rewritten.
close all;
dynare basicNKMtidy noclearall;

baseline_M = M_;
baseline_options = options_;
baseline_oo = oo_;
shock_label = 'epsilon_z';
vars_to_plot = {'y', 'ygap', 'r', 'rn', 'int', 'pii', 'p', 'xi_z'};
plot_titles = {'Output', 'Output gap', 'Real interest rate', ...
    'Natural interest rate', 'Nominal interest rate', ...
    'Inflation', 'Price level', 'Technology shock'};
scale_400 = ismember(vars_to_plot, {'r', 'rn', 'int', 'pii'});
rho_i_vals = [0.75, 0];
labels = {'\rho_i = 0.75', '\rho_i = 0'};
IRFs = struct();
irf_horizon = 40;

try
    for policy_index = 1:numel(rho_i_vals)
        set_param_value('rho_i', rho_i_vals(policy_index));
        options_.irf = irf_horizon;
        options_.nograph = true;
        options_.noprint = true;
        [info, oo_, options_, M_] = stoch_simul(M_, options_, oo_, {});
        if info(1) ~= 0
            error('Simulation failed for rho_i = %g (code %g).', ...
                rho_i_vals(policy_index), info(1));
        end
        for variable_index = 1:numel(vars_to_plot)
            variable_name = vars_to_plot{variable_index};
            irf_name = [variable_name, '_', shock_label];
            if ~isfield(oo_.irfs, irf_name)
                error('Missing impulse response: %s', irf_name);
            end
            series = oo_.irfs.(irf_name);
            if numel(series) < irf_horizon || any(~isfinite(series(:)))
                error('Invalid impulse response: %s', irf_name);
            end
            IRFs(policy_index).(variable_name) = series(:);
        end
    end
catch comparison_error
    M_ = baseline_M;
    options_ = baseline_options;
    oo_ = baseline_oo;
    rethrow(comparison_error);
end
% Restore the baseline model and results for subsequent exercises.
M_ = baseline_M;
options_ = baseline_options;
oo_ = baseline_oo;

figure('Name', 'Technology shock: interest-rate smoothing');
for variable_index = 1:numel(vars_to_plot)
    subplot(3, 3, variable_index);
    hold on;
    for policy_index = 1:numel(rho_i_vals)
        series = IRFs(policy_index).(vars_to_plot{variable_index});
        if scale_400(variable_index)
            series = 400 * series;
        else
            series = 100 * series;
        end
        plot(0:irf_horizon, [0; series(1:irf_horizon)], 'LineWidth', 1.5);
    end
    hold off;
    title(plot_titles{variable_index});
    xlabel('Quarters');
    if scale_400(variable_index)
        ylabel('Percentage points (annualised)');
    else
        ylabel('Per cent');
    end
    grid on;
    if variable_index == 3
        legend(labels, 'Location', 'southwest');
    end
end
