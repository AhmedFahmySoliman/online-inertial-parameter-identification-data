function Figure10()

load('../data/CompactData/Figure10_Stats.mat','Stats')

plotNames = Stats.Figure10.plotNames;

C = [0.98,0.71,0.82;
     0.48,1.00,0.00;
     0.50,0.85,1.00];

figure(1); clf;

%% -------- Torque RMSE --------
subplot(1,2,1)

Y = Stats.Figure10.ErrMean;
E = Stats.Figure10.ErrStd;

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
    'HorizontalAlignment','center', ...
    'FontName','Times New Roman', ...
    'FontSize',12)

text(2, yl(1)-0.08*(yl(2)-yl(1)), ...
    {'Walking','(Simulation)'}, ...
    'HorizontalAlignment','center', ...
    'FontName','Times New Roman', ...
    'FontSize',12)

legend(plotNames,'Location','northwest')
ylim([1 50])
grid on

set(gca,'FontName','Times New Roman','FontSize',12,'LineWidth',1)

%% -------- Computation Time --------
subplot(1,2,2)

Y = Stats.Figure10.CompTimeMean;
E = Stats.Figure10.CompTimeStd;

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
    'HorizontalAlignment','center', ...
    'FontName','Times New Roman', ...
    'FontSize',12)

text(2, yl(1)-0.08*(yl(2)-yl(1)), ...
    {'Walking','(Simulation)'}, ...
    'HorizontalAlignment','center', ...
    'FontName','Times New Roman', ...
    'FontSize',12)

legend(plotNames,'Location','northwest')
ylim([2 100])
grid on

set(gca,'FontName','Times New Roman','FontSize',12,'LineWidth',1)
set(gcf,'Color','w')
set(findall(gcf,'Type','axes'),'FontSize',12)

saveCurrentFigure('Figure10');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure10.png" in the "results" folder.');
disp('====================================================');

end
