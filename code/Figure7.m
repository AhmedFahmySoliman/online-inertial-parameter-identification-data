function Figure7(I2)

load('../data/CompactData/Hardware_Compact_All.mat','Compact')

Data_Prop = Compact.Prop;
l = length(Data_Prop);
t = Compact.Time{1};

sub = I2;
l = length(sub);

if l ~= 1
    error('invalid selection')
end

if ismember(sub,1:30)
    Tau_act = Data_Prop(sub).NTau_act;
    Tau_est = Data_Prop(sub).NTau_est;
else
    error('invalid selection')
end

t0 = 3; tf = 12;
X_SP = [t0 tf];
I_sp = (t>=t0) & (t<=tf);

figure(11)
RMSE_joint = nan(4,1);
for i=1:4
    a(i) = subplot(4,1,i);
    err_i = Tau_est(I_sp,i) - Tau_act(I_sp,i);
    RMSE_joint(i) = rms(err_i,'omitnan');

    plot(t,Tau_act(:,i),'r-','linewidth',2), hold on
    plot(t,Tau_est(:,i),'color',[0 0.6 0],'LineStyle','-','linewidth',2),hold off
    
    y_max = max([max(Tau_act(I_sp,i)) max(Tau_est(I_sp,i))]);
    y_min = min([min(Tau_act(I_sp,i)) min(Tau_est(I_sp,i))]);
    ylim([y_min y_max] + 0.2*[-abs(y_min) abs(y_max)])
    
    % y_max = max([max(Tau_est(I_sp,i)-Tau_act(I_sp,i))]);
    % y_min = min([min(Tau_est(I_sp,i)-Tau_act(I_sp,i))]);
    % ylim([y_min y_max] + 2*[-abs(y_min) abs(y_max)])

    xlim(X_SP);
    grid on, box on

    ax = gca;
    % ax.YAxis.Color = [0 0 0];

if i==1
    text(0.02,0.85,'Hip A/A', ...
        'Units','normalized', ...
        'FontName','Times New Roman', ...
        'FontSize',12, ...
        'BackgroundColor','none');
    set(gca,'XTickLabel',[])

elseif i==2
    text(0.02,0.85,'Hip F/E', ...
        'Units','normalized', ...
        'FontName','Times New Roman', ...
        'FontSize',12, ...
        'BackgroundColor','none');
    set(gca,'XTickLabel',[])

elseif i==3
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
    lgd.Color = 'none';    % transparent background
    
set(gca,'XTickLabel',[])
elseif i==4
    text(0.02,0.85,'Ankle', ...
        'Units','normalized', ...
        'FontName','Times New Roman', ...
        'FontSize',12, ...
        'BackgroundColor','none');

    xlabel('Time [s]')
end
set(gca,'FontName', 'Times New Roman','FontSize', 14,'LineWidth',1)

end
a1_pos = get(a(1),'Position'); a2_pos = get(a(2),'Position'); a3_pos = get(a(3),'Position');a4_pos = get(a(4),'Position');
c = 1.25;
set(a(4),'Position',[a4_pos(1) a4_pos(2) a4_pos(3) c*a4_pos(4)])
set(a(3),'Position',[a4_pos(1) a4_pos(2)+a4_pos(4)+0.06 a4_pos(3) c*a4_pos(4)])
set(a(2),'Position',[a4_pos(1) a4_pos(2)+2*(a4_pos(4)+0.06) a4_pos(3) c*a4_pos(4)])
set(a(1),'Position',[a4_pos(1) a4_pos(2)+3*(a4_pos(4)+0.06) a4_pos(3) c*a4_pos(4)])

han = axes(gcf,'visible','off');
han.YLabel.Visible = 'on';

hy = ylabel(han,'Torque [Nm]', ...
    'FontName','Times New Roman', ...
    'FontSize',12+2);

hy.Units = 'normalized';
hy.Position(1) = -0.1;

x0 = 150; y0 = 0;
width = 600; height = 750;
set(gcf,'position',[x0,y0,width,height])

left  = 0.12;
width = 0.80;

for k = 1:4
    pos = get(a(k),'Position');
    set(a(k),'Position',[left pos(2) width pos(4)]);
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
