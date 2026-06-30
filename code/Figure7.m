function Figure7(I2)

load('../data/CompactData/Figure7_Stats.mat','Figure7Data')

sub = I2;
if length(sub) ~= 1
    error('invalid selection')
end

if ismember(sub, Figure7Data.SelectedExp)
    k = find(Figure7Data.SelectedExp == sub, 1);
elseif ismember(sub, 1:numel(Figure7Data.SelectedExp))
    k = sub;
else
    error('invalid selection. Available original experiment indices are: %s', ...
        mat2str(Figure7Data.SelectedExp))
end

t = Figure7Data.Time;
Tau_act = Figure7Data.Exp(k).Tau_act;
Tau_est = Figure7Data.Exp(k).Tau_est;
RMSE_joint = Figure7Data.Exp(k).RMSE_joint;

t0 = Figure7Data.t0;
tf = Figure7Data.tf;
X_SP = [t0 tf];
I_sp = (t >= t0) & (t <= tf);

figure(11)
clf

for i = 1:4
    a(i) = subplot(4,1,i);

    plot(t,Tau_act(:,i),'r-','LineWidth',2)
    hold on
    plot(t,Tau_est(:,i),'color',[0 0.6 0],'LineStyle','-','LineWidth',2)
    hold off

    y_max = max([max(Tau_act(I_sp,i)) max(Tau_est(I_sp,i))]);
    y_min = min([min(Tau_act(I_sp,i)) min(Tau_est(I_sp,i))]);

    if y_max == y_min
        ylim([y_min-1 y_max+1])
    else
        ylim([y_min y_max] + 0.2*[-abs(y_min) abs(y_max)])
    end

    xlim(X_SP)
    grid on
    box on

    if i == 1
        text(0.02,0.85,'Hip A/A', ...
            'Units','normalized', ...
            'FontName','Times New Roman', ...
            'FontSize',12, ...
            'BackgroundColor','none');
        set(gca,'XTickLabel',[])

    elseif i == 2
        text(0.02,0.85,'Hip F/E', ...
            'Units','normalized', ...
            'FontName','Times New Roman', ...
            'FontSize',12, ...
            'BackgroundColor','none');
        set(gca,'XTickLabel',[])

    elseif i == 3
        text(0.02,0.85,'Knee', ...
            'Units','normalized', ...
            'FontName','Times New Roman', ...
            'FontSize',12, ...
            'BackgroundColor','none');

        lgd = legend({'$\mathbf{\tilde{\tau}}^{act}$', ...
                      '$\mathbf{\tilde{\tau}}^{est}$'}, ...
                      'Interpreter','Latex', ...
                      'Location','northeast', ...
                      'NumColumns',2, ...
                      'FontSize',18);
        lgd.Box = 'off';
        lgd.Color = 'none';

        set(gca,'XTickLabel',[])

    elseif i == 4
        text(0.02,0.85,'Ankle', ...
            'Units','normalized', ...
            'FontName','Times New Roman', ...
            'FontSize',12, ...
            'BackgroundColor','none');

        xlabel('Time [s]')
    end

    set(gca,'FontName','Times New Roman','FontSize',14,'LineWidth',1)
end

a4_pos = get(a(4),'Position');
c = 1.25;

set(a(4),'Position',[a4_pos(1) a4_pos(2) a4_pos(3) c*a4_pos(4)])
set(a(3),'Position',[a4_pos(1) a4_pos(2)+a4_pos(4)+0.06 a4_pos(3) c*a4_pos(4)])
set(a(2),'Position',[a4_pos(1) a4_pos(2)+2*(a4_pos(4)+0.06) a4_pos(3) c*a4_pos(4)])
set(a(1),'Position',[a4_pos(1) a4_pos(2)+3*(a4_pos(4)+0.06) a4_pos(3) c*a4_pos(4)])

han = axes(gcf,'visible','off');
han.YLabel.Visible = 'on';

hy = ylabel(han,'Torque [Nm]', ...
    'FontName','Times New Roman', ...
    'FontSize',14);

hy.Units = 'normalized';
hy.Position(1) = -0.1;

x0 = 150;
y0 = 0;
figWidth = 600;
figHeight = 750;
set(gcf,'Position',[x0,y0,figWidth,figHeight])

left = 0.12;
plotWidth = 0.80;

for kk = 1:4
    pos = get(a(kk),'Position');
    set(a(kk),'Position',[left pos(2) plotWidth pos(4)]);
end

saveCurrentFigure('Figure7');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure7.png" in the "results" folder.');
disp('====================================================');

fprintf('\n===== Joint Torque RMSE =====\n');
fprintf('HAA : %.3f Nm\n', RMSE_joint(1));
fprintf('HFE : %.3f Nm\n', RMSE_joint(2));
fprintf('HK  : %.3f Nm\n', RMSE_joint(3));
fprintf('HA  : %.3f Nm\n', RMSE_joint(4));

end
