function Results = extract_metrics(Data_Prop, Data_RSDP, Data_RDPM, Time, nj, eps_err, eps_var, dwell_time)

l = length(Data_Prop);
L = length(Time);

I0 = 1;
If = L;

Err_Data_Prop = nan(l,L);
Err_Data_RSDP = nan(l,L);
Err_Data_RDPM = nan(l,L);

Time_Data_Prop = nan(l,L);
Time_Data_RSDP = nan(l,L);
Time_Data_RDPM = nan(l,L);

ErrJoint_Prop_RMS = nan(l,1);
ErrJoint_RSDP_RMS = nan(l,1);
ErrJoint_RDPM_RMS = nan(l,1);

ErrJoint_Prop_Rel = nan(l,1);
ErrJoint_RSDP_Rel = nan(l,1);
ErrJoint_RDPM_Rel = nan(l,1);

Time_Prop_rms = nan(l,1);
Time_RSDP_rms = nan(l,1);
Time_RDPM_rms = nan(l,1);

Ts_Prop = nan(l,1);
Ts_RSDP = nan(l,1);
Ts_RDPM = nan(l,1);

for i = 1:l

    Err_Data_Prop(i,1:L)  = Data_Prop(i).Err(1:L);
    Err_Data_RSDP(i,1:L)  = Data_RSDP(i).Err(1:L);
    Err_Data_RDPM(i,1:L)  = Data_RDPM(i).Err(1:L);

    Time_Data_Prop(i,1:L) = Data_Prop(i).Comp_Time_ms(1:L);
    Time_Data_RSDP(i,1:L) = Data_RSDP(i).Comp_Time_ms(1:L);
    Time_Data_RDPM(i,1:L) = Data_RDPM(i).Comp_Time_ms(1:L);

    ErrJoint_Prop_RMS(i,1) = 0;
    ErrJoint_RSDP_RMS(i,1) = 0;
    ErrJoint_RDPM_RMS(i,1) = 0;

    ErrJoint_Prop_Rel(i,1) = 0;
    ErrJoint_RSDP_Rel(i,1) = 0;
    ErrJoint_RDPM_Rel(i,1) = 0;

    for j = 1:nj

        tau_est = Data_Prop(i).NTau_est(:,j);
        tau_act = Data_Prop(i).NTau_act(:,j);

        abs_rmse = rms(tau_est - tau_act);
        rel_rmse = 100 * abs_rmse / max(rms(tau_act),1e-12);

        ErrJoint_Prop_RMS(i,1) = ErrJoint_Prop_RMS(i,1) + abs_rmse;
        ErrJoint_Prop_Rel(i,1) = ErrJoint_Prop_Rel(i,1) + rel_rmse;

        tau_est = Data_RSDP(i).NTau_est(:,j);
        tau_act = Data_RSDP(i).NTau_act(:,j);

        abs_rmse = rms(tau_est - tau_act);
        rel_rmse = 100 * abs_rmse / max(rms(tau_act),1e-12);

        ErrJoint_RSDP_RMS(i,1) = ErrJoint_RSDP_RMS(i,1) + abs_rmse;
        ErrJoint_RSDP_Rel(i,1) = ErrJoint_RSDP_Rel(i,1) + rel_rmse;

        tau_est = Data_RDPM(i).NTau_est(:,j);
        tau_act = Data_RDPM(i).NTau_act(:,j);

        abs_rmse = rms(tau_est - tau_act);
        rel_rmse = 100 * abs_rmse / max(rms(tau_act),1e-12);

        ErrJoint_RDPM_RMS(i,1) = ErrJoint_RDPM_RMS(i,1) + abs_rmse;
        ErrJoint_RDPM_Rel(i,1) = ErrJoint_RDPM_Rel(i,1) + rel_rmse;

    end

    ErrJoint_Prop_RMS(i,1) = ErrJoint_Prop_RMS(i,1)/nj;
    ErrJoint_RSDP_RMS(i,1) = ErrJoint_RSDP_RMS(i,1)/nj;
    ErrJoint_RDPM_RMS(i,1) = ErrJoint_RDPM_RMS(i,1)/nj;

    ErrJoint_Prop_Rel(i,1) = ErrJoint_Prop_Rel(i,1)/nj;
    ErrJoint_RSDP_Rel(i,1) = ErrJoint_RSDP_Rel(i,1)/nj;
    ErrJoint_RDPM_Rel(i,1) = ErrJoint_RDPM_Rel(i,1)/nj;

    Time_Prop_rms(i,1) = rms(Time_Data_Prop(i,I0:If),'omitnan');
    Time_RSDP_rms(i,1) = rms(Time_Data_RSDP(i,I0:If),'omitnan');
    Time_RDPM_rms(i,1) = rms(Time_Data_RDPM(i,I0:If),'omitnan');

    Ts_Prop(i,1) = robust_parameter_settling_time(Time, Data_Prop(i).PI,  eps_err, eps_var, dwell_time);
    Ts_RSDP(i,1) = robust_parameter_settling_time(Time, Data_RSDP(i).PI,  eps_err, eps_var, dwell_time);
    Ts_RDPM(i,1) = robust_parameter_settling_time(Time, Data_RDPM(i).PI, eps_err, eps_var, dwell_time);

    Cond_Prop(i,1) = Data_Prop(i).Cond_mean;
    Cond_RSDP(i,1) = Data_RSDP(i).Cond_mean;   %Convert to Data_RSDP(i).ExpData.LCond_mean for Hardware Experiments
    Cond_RDPM(i,1) = Data_RDPM(i).Cond_mean;

end

Ts       = [Ts_Prop Ts_RSDP Ts_RDPM];
Err      = [ErrJoint_Prop_RMS ErrJoint_RSDP_RMS ErrJoint_RDPM_RMS];
Err_rel  = [ErrJoint_Prop_Rel ErrJoint_RSDP_Rel ErrJoint_RDPM_Rel];
CompTime = [Time_Prop_rms Time_RSDP_rms Time_RDPM_rms];
Cond     = [Cond_Prop Cond_RSDP Cond_RDPM];

methodNames = {'Prop','RSDP','RDPM'};

settledFlag = ~isnan(Ts);
successRate = 100 * sum(settledFlag,1) / size(Ts,1);

SuccessTable = table(methodNames', successRate', ...
    'VariableNames', {'Method','SettlingSuccessRate_percent'});

T_end = max(Time);

Ts_censored = Ts;
Ts_censored(isnan(Ts_censored)) = T_end;

Results.Ts = Ts;
Results.Ts_censored = Ts_censored;
Results.Err = Err;
Results.Err_rel = Err_rel;
Results.CompTime = CompTime;
Results.SuccessTable = SuccessTable;
Results.Cond = Cond;

end