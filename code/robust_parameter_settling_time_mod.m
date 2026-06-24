function [Ts, Conv] = robust_parameter_settling_time_mod(time, PI, eps_err, eps_var, dwell_time, do_plot)

    if nargin < 6
        do_plot = true;
    end

    N = length(time);
    dt = mean(diff(time));

    % Final parameter value: average over last 10% of samples
    N_final = max(round(0.1*N), 1);
    PI_final = mean(PI(end-N_final+1:end,:), 1);

    norm_final = max(norm(PI_final), 1e-12);

    % Normalized distance from final value
    err = vecnorm(PI - PI_final, 2, 2) ./ norm_final;

    % Normalized parameter variation
    dPI = [zeros(1,size(PI,2)); diff(PI)];
    var_idx = vecnorm(dPI, 2, 2) ./ norm_final;

    % Optional smoothing to avoid sample-level noise
    win = max(round(0.1/dt), 1);   % 0.1 s smoothing
    err_s = smoothdata(err, 'movmean', win);
    var_s = smoothdata(var_idx, 'movmean', win);

    stable = (err_s < eps_err) & (var_s < eps_var);

    dwell_samples = max(round(dwell_time/dt), 1);

    Ts = NaN;

    for k = 1:(N-dwell_samples+1)
        if all(stable(k:k+dwell_samples-1))
            if mean(stable(k:end)) > 0.95
                Ts = time(k);
                break;
            end
        end
    end

    % Store outputs for later use
    Conv.err       = err;
    Conv.err_s     = err_s;
    Conv.var_idx   = var_idx;
    Conv.var_s     = var_s;
    Conv.stable    = stable;
    Conv.PI_final  = PI_final;
    Conv.Ts        = Ts;

    % Plot convergence
    if do_plot
        figure; hold on; grid on; box on

        plot(time, err_s, 'LineWidth', 2);
        plot(time, var_s, 'LineWidth', 2);

        yline(eps_err, '--', 'LineWidth', 1.5);
        yline(eps_var, '--', 'LineWidth', 1.5);

        if ~isnan(Ts)
            xline(Ts, 'k--', 'LineWidth', 2);
            legend({'Normalized parameter error', ...
                    'Normalized parameter variation', ...
                    '\epsilon_{err}', ...
                    '\epsilon_{var}', ...
                    'Settling time'}, ...
                    'Interpreter','latex', ...
                    'Location','northeast');
        else
            legend({'Normalized parameter error', ...
                    'Normalized parameter variation', ...
                    '\epsilon_{err}', ...
                    '\epsilon_{var}'}, ...
                    'Interpreter','latex', ...
                    'Location','northeast');
        end

        xlabel('Time [s]', 'Interpreter','latex');
        ylabel('Normalized value [-]', 'Interpreter','latex');
        title('Inertial-Parameter Convergence', 'Interpreter','latex');

        set(gca, 'FontName','Times New Roman', ...
                 'FontSize',14, ...
                 'LineWidth',1);
    end
end