function Ts = robust_parameter_settling_time(time, PI, eps_err, eps_var, dwell_time)

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
            % Additional protection:
            % after this point, the signal should not strongly leave the band
            if mean(stable(k:end)) > 0.95
                Ts = time(k);
                break;
            end
        end
    end
end