function Figure10()
%% ===================== SETTINGS =====================
nj = 4;

eps_err    = 0.05;
eps_var    = 0.01;
dwell_time = 0.5;

plotNames   = {'Proposed','RSDP','RDPM'};

%% ===================== LOAD HARDWARE DATA =====================
load('../data/CompactData/Hardware_Compact_All.mat','Compact')

Data_Prop = Compact.Prop;
Data_RSDP = Compact.RSDP;
Data_RDPM = Compact.RDPM;

Time_hw = Compact.Time{1};

Results_HW = extract_metrics( ...
    Data_Prop, Data_RSDP, Data_RDPM, ...
    Time_hw, nj, eps_err, eps_var, dwell_time);

Results_HW.name = 'Hardware';

%% ===================== LOAD SIMULATION DATA =====================
load('../data/CompactData/Simulation_Compact_All.mat','Compact')

Data_Prop_sim = Compact.Prop;
Data_RSDP_sim = Compact.RSDP;
Data_RDPM_sim = Compact.RDPM;

Time_sim =  Compact.Time{1};

Results_SIM = extract_metrics( ...
    Data_Prop_sim, Data_RSDP_sim, Data_RDPM_sim, ...
    Time_sim, nj, eps_err, eps_var, dwell_time);

Results_SIM.name = 'Walking Simulation';

%% ===================== BAR PLOTS =====================
C = [0.98,0.71,0.82;
     0.48,1.00,0.00;
     0.50,0.85,1.00];

figure(1); clf;

% -------- Torque RMSE --------
subplot(1,2,1)
Y = [mean(Results_HW.Err,1);
     mean(Results_SIM.Err,1)];

E = [std(Results_HW.Err,0,1);
     std(Results_SIM.Err,0,1)];

b = bar(Y,'grouped');
for k = 1:3
    b(k).FaceColor = C(k,:);
end
hold on
add_grouped_errorbars(b,Y,E)
ylabel('Torque RMSE [N.m]')
xticks([1 2])
xticklabels({'' ''})
yl = ylim;
text(1, yl(1)-0.08*(yl(2)-yl(1)), ...
    {'Squatting/Swaying','(Hardware)'}, ...
    'HorizontalAlignment','center','FontName', 'Times New Roman','FontSize', 12)
text(2, yl(1)-0.08*(yl(2)-yl(1)), ...
    {'Walking','(Simulation)'}, ...
    'HorizontalAlignment','center','FontName', 'Times New Roman','FontSize', 12)
legend(plotNames,'Location','northwest')
ylim([1 50]); grid on
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle = '-';
set(gca,'FontName', 'Times New Roman','FontSize', 12)

% -------- Computation Time --------
subplot(1,2,2)
Y = [mean(Results_HW.CompTime,1);
     mean(Results_SIM.CompTime,1)];

E = [std(Results_HW.CompTime,0,1);
     std(Results_SIM.CompTime,0,1)];

b = bar(Y,'grouped');
for k = 1:3
    b(k).FaceColor = C(k,:);
end
hold on
add_grouped_errorbars(b,Y,E)
ylabel('Computation Time [ms]')
xticks([1 2])
xticklabels({'' ''})
yl = ylim;
text(1, yl(1)-0.08*(yl(2)-yl(1)), ...
    {'Squatting/Swaying','(Hardware)'}, ...
    'HorizontalAlignment','center','FontName', 'Times New Roman','FontSize', 12)
text(2, yl(1)-0.08*(yl(2)-yl(1)), ...
    {'Walking','(Simulation)'}, ...
    'HorizontalAlignment','center','FontName', 'Times New Roman','FontSize', 12)
legend(plotNames,'Location','northwest')
ylim([2 100]); grid on
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle = '-';

set(gcf,'Color','w')
set(findall(gcf,'Type','axes'),'FontSize',12)

saveCurrentFigure('Figure10');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure10.png" in the "results" folder.');
disp('====================================================');

end
