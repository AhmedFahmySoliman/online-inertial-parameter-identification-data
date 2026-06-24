function Figure5(I2, I3)
%was Figure 9

FolderName = fullfile('..','data');

File = fullfile(FolderName,'Time.mat'); F = load(File); Time = F.t; clear F;

File = fullfile(FolderName,'Tau_HAA_act.mat');  F = load(File);  Tau_HAA_act = F.Tau_HAA_act_Pstp_mean; clear F;
File = fullfile(FolderName,'Tau_HAA_est.mat');  F = load(File);  Tau_HAA_est = F.Tau_HAA_est_Pstp_mean; clear F;
File = fullfile(FolderName,'Tau_HFE_act.mat');  F = load(File);  Tau_HFE_act = F.Tau_HFE_act_Pstp_mean; clear F;
File = fullfile(FolderName,'Tau_HFE_est.mat');  F = load(File);  Tau_HFE_est = F.Tau_HFE_est_Pstp_mean; clear F;
File = fullfile(FolderName,'Tau_HK_act.mat');  F = load(File);  Tau_HK_act = F.Tau_HK_act_Pstp_mean; clear F;
File = fullfile(FolderName,'Tau_HK_est.mat');  F = load(File);  Tau_HK_est = F.Tau_HK_est_Pstp_mean; clear F;
File = fullfile(FolderName,'Tau_HA_act.mat');  F = load(File);  Tau_HA_act = F.Tau_HA_act_Pstp_mean; clear F;
File = fullfile(FolderName,'Tau_HA_est.mat');  F = load(File);  Tau_HA_est = F.Tau_HA_est_Pstp_mean; clear F;


sub = I2;l = length(sub);

% prompt2='Input selected velocity value from the given values [80 90 100 110 120 130]: ';
% vel = input(prompt2);

vel = I3;l = length(vel);

if (l>2 || l<2)
    error('invalid selection')
else

if (vel(1)==80)
    v_1 = 1;
elseif (vel(1)==90)
    v_1 = 2;
elseif (vel(1)==100)
    v_1 = 3;
elseif (vel(1)==110)
    v_1 = 4;
elseif (vel(1)==120)
    v_1 = 5;
elseif (vel(1)==130)
    v_1 = 6;
else
   error('invalid selection')
end

if (vel(2)==80)
    v_2 = 1;
elseif (vel(2)==90)
    v_2 = 2;
elseif (vel(2)==100)
    v_2 = 3;
elseif (vel(2)==110)
    v_2 = 4;
elseif (vel(2)==120)
    v_2 = 5;
elseif (vel(2)==130)
    v_2 = 6;
else
   error('invalid selection')
end

if (sub>12 || sub<1 )
    error('invalid selection')
else

n_steps  = 20; t_stepF = 1.6;
t_step = 0:0.001:t_stepF;
t_span = 51:500; t_span2 = 851:1300;
term = [0.45 0.9 1.35];
FS = 14;
figure(7); clf

a(1) = subplot(4,1,1);
hold on

plot(t_step(t_span)-t_step(t_span(1)),Tau_HAA_est(t_span,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','LineWidth',2,'Marker','none')
plot(t_step(t_span)-t_step(t_span(1)),Tau_HAA_act(t_span,sub,v_1),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(1)-0.05,Tau_HAA_est(t_span2,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(1)-0.05,Tau_HAA_act(t_span2,sub,v_1),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(2)-0.05,Tau_HAA_est(t_span,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(2)-0.05,Tau_HAA_act(t_span,sub,v_2),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(3)-0.05,Tau_HAA_est(t_span2,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(3)-0.05,Tau_HAA_act(t_span2,sub,v_2),'r-','linewidth',2,'Marker','none')

grid on, grid minor, box on
plot(term(2)*ones(1,2),[-120 250],'k-','LineWidth',1,'Marker','none')
plot(term(1)*ones(1,2),[-120 250],'k-','LineWidth',1,'Marker','none')
plot(term(3)*ones(1,2),[-120 250],'k-','LineWidth',1,'Marker','none')

text(0.02,0.85,'Hip A/A','Units','normalized', ...
    'FontName','Times New Roman','FontSize',FS-2, ...
    'BackgroundColor','none','Margin',1)

set(gca,'Xticklabel',[]);
set(gca, 'FontName','Times New Roman', 'FontSize', FS, 'LineWidth', 1);
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';
ylim([-120 200]), xlim([0 1.8])
xticks([]);
ax.XAxis.MinorTickValues = 0:0.3:2.4;
ax.YAxis.MinorTickValues = -100:50:200;
ax.YAxis.Color = [0 0 0];
yticks(-100:100:200);


a(2) = subplot(4,1,2);
hold on

plot(t_step(t_span)-t_step(t_span(1)),Tau_HFE_est(t_span,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)-t_step(t_span(1)),Tau_HFE_act(t_span,sub,v_1),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(1)-0.05,Tau_HFE_est(t_span2,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(1)-0.05,Tau_HFE_act(t_span2,sub,v_1),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(2)-0.05,Tau_HFE_est(t_span,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(2)-0.05,Tau_HFE_act(t_span,sub,v_2),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(3)-0.05,Tau_HFE_est(t_span2,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(3)-0.05,Tau_HFE_act(t_span2,sub,v_2),'r-','linewidth',2,'Marker','none')

grid on, grid minor, box on
plot(term(2)*ones(1,2),[-120 120],'k-','LineWidth',1,'Marker','none')
plot(term(1)*ones(1,2),[-120 120],'k-','LineWidth',1,'Marker','none')
plot(term(3)*ones(1,2),[-120 120],'k-','LineWidth',1,'Marker','none')

text(0.2,-90,['v = ',num2str(vel(1)), ' mm/s'],'FontSize',16, 'FontName','Times New Roman','BackgroundColor',[1 1 1]);
text(0.15+1,-90,['v = ',num2str(vel(2)), ' mm/s'],'FontSize',16, 'FontName','Times New Roman','BackgroundColor',[1 1 1]);

text(0.02,0.85,'Hip F/E','Units','normalized', ...
    'FontName','Times New Roman','FontSize',FS-2, ...
    'BackgroundColor','none','Margin',1)

set(gca,'Xticklabel',[]);
set(gca, 'FontName','Times New Roman', 'FontSize', FS, 'LineWidth', 1);
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';
xlim([0 1.8])
xticks([]);
ax.XAxis.MinorTickValues = 0:0.3:2.4;
ylim([-120 120])
ax.YAxis.MinorTickValues = -100:50:100;
ax.YAxis.Color = [0 0 0];
yticks(-100:100:100);


a(3) = subplot(4,1,3);
hold on

plot(t_step(t_span)-t_step(t_span(1)),Tau_HK_est(t_span,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)-t_step(t_span(1)),Tau_HK_act(t_span,sub,v_1),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(1)-0.05,Tau_HK_est(t_span2,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(1)-0.05,Tau_HK_act(t_span2,sub,v_1),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(2)-0.05,Tau_HK_est(t_span,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(2)-0.05,Tau_HK_act(t_span,sub,v_2),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(3)-0.05,Tau_HK_est(t_span2,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(3)-0.05,Tau_HK_act(t_span2,sub,v_2),'r-','linewidth',2,'Marker','none')

grid on, grid minor, box on
plot(term(2)*ones(1,2),[-320 120],'k-','LineWidth',1,'Marker','none')
plot(term(1)*ones(1,2),[-320 120],'k-','LineWidth',1,'Marker','none')
plot(term(3)*ones(1,2),[-320 120],'k-','LineWidth',1,'Marker','none')

text(0.02,0.85,'Knee','Units','normalized', ...
    'FontName','Times New Roman','FontSize',FS-2, ...
    'BackgroundColor','none','Margin',1)

set(gca,'Xticklabel',[]);
set(gca, 'FontName','Times New Roman', 'FontSize', FS, 'LineWidth', 1);
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';
xlim([0 1.8]), xticks([]);
ax.XAxis.MinorTickValues = 0:0.3:2.4;
ylim([-320 120])
ax.YAxis.MinorTickValues = -300:50:100;
ax.YAxis.Color = [0 0 0];
yticks(-300:100:100);


a(4) = subplot(4,1,4);
hold on

p1 = plot(t_step(t_span)-t_step(t_span(1)),Tau_HA_est(t_span,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none');
p2 = plot(t_step(t_span)-t_step(t_span(1)),Tau_HA_act(t_span,sub,v_1),'r-','linewidth',2,'Marker','none');

plot(t_step(t_span)+term(1)-0.05,Tau_HA_est(t_span2,sub,v_1),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(1)-0.05,Tau_HA_act(t_span2,sub,v_1),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(2)-0.05,Tau_HA_est(t_span,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(2)-0.05,Tau_HA_act(t_span,sub,v_2),'r-','linewidth',2,'Marker','none')

plot(t_step(t_span)+term(3)-0.05,Tau_HA_est(t_span2,sub,v_2),'Color',[0,0.6,0],'LineStyle','-','linewidth',2,'Marker','none')
plot(t_step(t_span)+term(3)-0.05,Tau_HA_act(t_span2,sub,v_2),'r-','linewidth',2,'Marker','none')

grid on, grid minor , box on
xticks([0 0.45 0.9 1.35])
set(gca,'Xticklabel',[0 0.45 0.9 1.35]);
box on
plot(term(2)*ones(1,2),[-50 220],'k-','LineWidth',1,'Marker','none')
plot(term(1)*ones(1,2),[-50 220],'k-','LineWidth',1,'Marker','none')
plot(term(3)*ones(1,2),[-50 220],'k-','LineWidth',1,'Marker','none')

text(0.02,0.85,'Ankle','Units','normalized', ...
    'FontName','Times New Roman','FontSize',FS-2, ...
    'BackgroundColor','none','Margin',1)

xlabel('Time [s]')
set(gca, 'FontName','Times New Roman', 'FontSize', FS, 'LineWidth', 1);
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';
xlim([0 1.8])
ax.XAxis.MinorTickValues = 0:0.3:2.4;
ylim([-50 220])
ax.YAxis.MinorTickValues = 0:50:200;
ax.YAxis.Color = [0 0 0];
yticks(0:100:200);


% Tighten subplot positions
a4_pos = get(a(4),'Position');
c = 1.25;
gap = 0.045;   % reduce this from 0.06 if needed

set(a(4),'Position',[a4_pos(1) a4_pos(2) a4_pos(3) c*a4_pos(4)])
set(a(3),'Position',[a4_pos(1) a4_pos(2)+a4_pos(4)+gap a4_pos(3) c*a4_pos(4)])
set(a(2),'Position',[a4_pos(1) a4_pos(2)+2*(a4_pos(4)+gap) a4_pos(3) c*a4_pos(4)])
set(a(1),'Position',[a4_pos(1) a4_pos(2)+3*(a4_pos(4)+gap) a4_pos(3) c*a4_pos(4)])

lgd = legend([p1 p2],{'$\hat{\tau}$','$\tau^{act}$'}, ...
    'Interpreter','Latex','Location','northeast', ...
    'NumColumns',2,'FontSize',14);
lgd.Box = 'off';
    lgd.Color = 'none';    % transparent background
% Common y-axis label
han = axes(gcf,'visible','off');
han.YLabel.Visible = 'on';
hy = ylabel(han,'Torque [Nm]', ...
    'FontName','Times New Roman', ...
    'FontSize',FS+2);
hy.Units = 'normalized';
hy.Position(1) = -0.1;

x0 = 150; y0 = 150;
width = 650; height = 650;   % reduced from 750
set(gcf,'position',[x0,y0,width,height])

end
end


saveCurrentFigure('Figure5');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure5.png" in the "results" folder.');
disp('====================================================');


% ===== RMSE calculation =====

RMSE_HAA = rms([
    Tau_HAA_est(t_span,sub,v_1)-Tau_HAA_act(t_span,sub,v_1);
    Tau_HAA_est(t_span2,sub,v_1)-Tau_HAA_act(t_span2,sub,v_1);
    Tau_HAA_est(t_span,sub,v_2)-Tau_HAA_act(t_span,sub,v_2);
    Tau_HAA_est(t_span2,sub,v_2)-Tau_HAA_act(t_span2,sub,v_2)]);

RMSE_HFE = rms([
    Tau_HFE_est(t_span,sub,v_1)-Tau_HFE_act(t_span,sub,v_1);
    Tau_HFE_est(t_span2,sub,v_1)-Tau_HFE_act(t_span2,sub,v_1);
    Tau_HFE_est(t_span,sub,v_2)-Tau_HFE_act(t_span,sub,v_2);
    Tau_HFE_est(t_span2,sub,v_2)-Tau_HFE_act(t_span2,sub,v_2)]);

RMSE_HK = rms([
    Tau_HK_est(t_span,sub,v_1)-Tau_HK_act(t_span,sub,v_1);
    Tau_HK_est(t_span2,sub,v_1)-Tau_HK_act(t_span2,sub,v_1);
    Tau_HK_est(t_span,sub,v_2)-Tau_HK_act(t_span,sub,v_2);
    Tau_HK_est(t_span2,sub,v_2)-Tau_HK_act(t_span2,sub,v_2)]);

RMSE_HA = rms([
    Tau_HA_est(t_span,sub,v_1)-Tau_HA_act(t_span,sub,v_1);
    Tau_HA_est(t_span2,sub,v_1)-Tau_HA_act(t_span2,sub,v_1);
    Tau_HA_est(t_span,sub,v_2)-Tau_HA_act(t_span,sub,v_2);
    Tau_HA_est(t_span2,sub,v_2)-Tau_HA_act(t_span2,sub,v_2)]);

fprintf('\n===== Joint Torque RMSE =====\n');
fprintf('HAA : %.3f Nm\n',RMSE_HAA);
fprintf('HFE : %.3f Nm\n',RMSE_HFE);
fprintf('HK  : %.3f Nm\n',RMSE_HK);
fprintf('HA  : %.3f Nm\n',RMSE_HA);
fprintf('Mean: %.3f Nm\n',mean([RMSE_HAA RMSE_HFE RMSE_HK RMSE_HA]));

end