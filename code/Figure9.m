function Figure9(I2)

load('../data/CompactData/Figure9_Stats.mat','Figure9Data')

sub = I2;
if length(sub) ~= 1
    error('invalid selection')
end

if ismember(sub, Figure9Data.SelectedExp)
    k = find(Figure9Data.SelectedExp == sub, 1);
elseif ismember(sub, 1:numel(Figure9Data.SelectedExp))
    k = sub;
else
    error('invalid selection. Available original experiment indices are: %s', ...
        mat2str(Figure9Data.SelectedExp))
end

Time = Figure9Data.Time;
eps_err = Figure9Data.eps_err;

D = Figure9Data.Exp(k);

figure;
set(gcf,'Position',[100 100 950 350])

%% Left subplot: normalized parameter error
subplot(1,2,1); hold on; grid on; box on

plot(Time, D.Err_Prop, 'color','r',       'LineWidth',2)
plot(Time, D.Err_RSDP, 'color',[0 0.6 0], 'LineWidth',2)
plot(Time, D.Err_RDPM, 'color','b',       'LineWidth',2)

yline(eps_err, 'k--', 'LineWidth',1.5)

if ~isnan(D.Ts_Prop)
    xline(D.Ts_Prop, 'r--', 'LineWidth',1.5)
end
if ~isnan(D.Ts_RSDP)
    xline(D.Ts_RSDP, '--', 'Color',[0 0.6 0], 'LineWidth',1.5)
end
if ~isnan(D.Ts_RDPM)
    xline(D.Ts_RDPM, 'b--', 'LineWidth',1.5)
end

xlim([0 13])
xlabel('Time [s]', 'Interpreter','latex')
ylabel('Parameter convergence [-]', 'Interpreter','latex')

legend({'Proposed','RSDP','RDPM','$\epsilon_\pi$', ...
        '$T_s$ Proposed','$T_s$ RSDP','$T_s$ RDPM'}, ...
        'Interpreter','latex', ...
        'Location','northeast')

set(gca, 'FontName','Times New Roman', ...
         'FontSize',13, ...
         'LineWidth',1)

%% Right subplot: representative hip mass parameter
subplot(1,2,2); hold on; grid on; box on

plot(Time, D.HipMass_Prop, ...
    'color','r', 'LineWidth',2)

plot(Time, D.HipMass_RSDP, ...
    'color',[0 0.6 0], 'LineWidth',2)

plot(Time, D.HipMass_RDPM, ...
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
