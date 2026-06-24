function Figure9(I2)

load('../data/CompactData/Hardware_Compact_All.mat','Compact')

Data_Prop = Compact.Prop;
Data_RSDP = Compact.RSDP;
Data_RDPM = Compact.RDPM;

Time = Compact.Time{1};

sub = I2; l = length(sub);

if l~=1
    error('invalid selection')
end

if ~ismember(sub,1:30)
    error('invalid selection')
end

eps_err    = 0.05;
eps_var    = 0.01;
dwell_time = 0.5;

i = I2; 
param_id = 20;   % hip mass parameter index

[Ts_Prop, Conv_Prop] = robust_parameter_settling_time_mod( ...
    Time, Data_Prop(i).PI, eps_err, eps_var, dwell_time, false);

[Ts_RSDP, Conv_RSDP] = robust_parameter_settling_time_mod( ...
    Time, Data_RSDP(i).PI, eps_err, eps_var, dwell_time, false);

[Ts_RDPM, Conv_RDPM] = robust_parameter_settling_time_mod( ...
    Time, Data_RDPM(i).PI, eps_err, eps_var, dwell_time, false);

figure; 
set(gcf,'Position',[100 100 950 350])

%% Left subplot: normalized parameter error
subplot(1,2,1); hold on; grid on; box on

plot(Time, Conv_Prop.err_s, 'color','r',       'LineWidth',2)
plot(Time, Conv_RSDP.err_s, 'color',[0 0.6 0], 'LineWidth',2)
plot(Time, Conv_RDPM.err_s, 'color','b',       'LineWidth',2)

yline(eps_err, 'k--', 'LineWidth',1.5)

if ~isnan(Ts_Prop)
    xline(Ts_Prop, 'r--', 'LineWidth',1.5)
end
if ~isnan(Ts_RSDP)
    xline(Ts_RSDP, '--', 'Color',[0 0.6 0], 'LineWidth',1.5)
end
if ~isnan(Ts_RDPM)
    xline(Ts_RDPM, 'b--', 'LineWidth',1.5)
end
xlim([0 13])
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Parameter convergence [-]', 'Interpreter','latex')

legend({'Proposed','RSDP','RDPM','$\epsilon_\pi$', ...
        '$T_s$ Proposed','$T_s$ RSDP','$T_s$ RDPM'}, ...
        'Interpreter','latex', ...
        'Location','northeast')

% title('(a) Parameter-vector convergence', 'Interpreter','latex')

set(gca, 'FontName','Times New Roman', ...
         'FontSize',13, ...
         'LineWidth',1)

%% Right subplot: representative hip mass parameter
subplot(1,2,2); hold on; grid on; box on

plot(Time, Data_Prop(i).PI(:,param_id), ...
    'color','r', 'LineWidth',2)

plot(Time, Data_RSDP(i).PI(:,param_id), ...
    'color',[0 0.6 0], 'LineWidth',2)

plot(Time, Data_RDPM(i).PI(:,param_id), ...
    'color','b', 'LineWidth',2)

xlim([0 13])
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Hip-link mass [kg]', 'Interpreter','latex')


legend({'Proposed','RSDP','RDPM'}, ...
        'Interpreter','latex', ...
        'Location','best')

set(gca, 'FontName','Times New Roman', ...
         'FontSize',13, ...
         'LineWidth',1)

saveCurrentFigure('Figure9');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure9.png" in the "results" folder.');
disp('====================================================');
end