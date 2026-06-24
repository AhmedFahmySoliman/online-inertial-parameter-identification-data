clear, clc, close all

FolderName = fullfile('..','data');
File = fullfile(FolderName,'MC.mat'); F = load(File); MC = F.MC.M;  I = F.MC.I; clear F;

t = MC(:,1);
Acc_IPTA_mean  = MC(:,2);  Acc_IPTA_std  = MC(:,3);
Acc_NIPTA_mean = MC(:,4);  Acc_NIPTA_std = MC(:,5);
Acc_Ko_mean    = MC(:,6);  Acc_Ko_std    = MC(:,7);
dt_IPTA_mean   = MC(:,8);  dt_IPTA_std   = MC(:,9);
dt_NIPTA_mean  = MC(:,10); dt_NIPTA_std  = MC(:,11);
dt_Ko_mean     = MC(:,12); dt_Ko_std     = MC(:,13);

Acc_IPTA_max = Acc_IPTA_mean+Acc_IPTA_std; Acc_IPTA_min = Acc_IPTA_mean-Acc_IPTA_std;
Acc_NIPTA_max = Acc_NIPTA_mean+Acc_NIPTA_std; Acc_NIPTA_min = Acc_NIPTA_mean-Acc_NIPTA_std;
Acc_Ko_max = Acc_Ko_mean+Acc_Ko_std; Acc_Ko_min = Acc_Ko_mean-Acc_Ko_std;

dt_IPTA_max = dt_IPTA_mean+dt_IPTA_std; dt_IPTA_min = dt_IPTA_mean-dt_IPTA_std;
dt_NIPTA_max = dt_NIPTA_mean+dt_NIPTA_std; dt_NIPTA_min = dt_NIPTA_mean-dt_NIPTA_std;
dt_Ko_max = dt_Ko_mean+dt_Ko_std; dt_Ko_min = dt_Ko_mean-dt_Ko_std;

FS = 20;
C = [0.98,0.71,0.82;0.48,1,0;0.5,0.85,1;0.8,0.8,0.8];

figure(4)
subplot(2,1,2)
hold on, grid on, grid minor, box on
for i = 1:I-1    %SD
    y_ct = [Acc_IPTA_min(i) Acc_IPTA_min(i+1) Acc_IPTA_max(i+1) Acc_IPTA_max(i+1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(1,:);
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
for i = 1:I-1    %SD
    y_ct = [Acc_NIPTA_min(i) Acc_NIPTA_min(i+1) Acc_NIPTA_max(i+1) Acc_NIPTA_max(i+1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(2,:);  
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
for i = 1:I-1    %SD
    y_ct = [Acc_Ko_min(i) Acc_Ko_min(i+1) Acc_Ko_max(i+1) Acc_Ko_max(i+1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(3,:);
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
p1 = plot(t,Acc_IPTA_mean,'r', 'LineWidth', 2);
p2 = plot(t,Acc_NIPTA_mean,'color',[0,0.6,0], 'LineWidth', 2);
p3 = plot(t,Acc_Ko_mean,'b', 'LineWidth', 2); hold off
ylabel('e_{rel}')
xlabel('Time [s]')
text(5,0.1,'b)','FontName','TimesNewRoman','FontSize',1.5*FS);
a_pos = get(gca,'Position');
set(gca,'Position',[a_pos(1) a_pos(2)-0.0 a_pos(3)+0.05 a_pos(4)+0.07])
set(gca, 'FontName','Times New Roman', 'FontSize', FS, 'LineWidth', 1);
h=legend([p1 p2 p3],'Proposed','RSDP','RDPM','Location','northeast','Numcolumns',3);
p = get(h,'Position');
% set(h,'Position',[p(1)+0.041 p(2)+0.057 p(3) p(4)])
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';


xlim([0 6]), ylim([-0.05 0.3])
ax.XAxis.MinorTickValues = 0:0.5:6;
ax.YAxis.MinorTickValues = -0.05:0.05:0.4;
yticks(0:0.1:0.3); xticks(0:6);

subplot(2,1,1)
hold on, grid on, grid minor, box on
for i = 1:I-1    %SD
    y_ct = [dt_IPTA_min(i) dt_IPTA_min(i+1) dt_IPTA_max(i+1) dt_IPTA_max(i+1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(1,:);
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
for i = 1:I-1    %SD
    y_ct = [dt_NIPTA_min(i) dt_NIPTA_min(i+1) dt_NIPTA_max(i+1) dt_NIPTA_max(i+1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(2,:);
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
for i = 1:I-1    %SD
    y_ct = [dt_Ko_min(i) dt_Ko_min(i+1) dt_Ko_max(i+1) dt_Ko_max(i+1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(3,:);
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
p1 = plot(t,dt_IPTA_mean,'r', 'LineWidth', 2);
p2 = plot(t,dt_NIPTA_mean,'color',[0,0.6,0], 'LineWidth', 2);
p3 = plot(t,dt_Ko_mean,'b', 'LineWidth', 2); hold off
set(gca,'Xticklabel',[]);
ylabel('t_c [ms]')
text(5,0,'a)','FontName','TimesNewRoman','FontSize',1.5*FS);
a_pos = get(gca,'Position');
set(gca,'Position',[a_pos(1) a_pos(2)-0.02 a_pos(3)+0.05 a_pos(4)+0.07])
set(gca, 'FontName','Times New Roman', 'FontSize', FS, 'LineWidth', 1);

ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';

xlim([0 6]), ylim([-50 200])
ax.XAxis.MinorTickValues = 0:0.5:6;
ax.YAxis.MinorTickValues = -50:50:450;
yticks(0:100:400); xticks(0:6);

x0=0;
y0=0;
width=950;
height=750;
set(gcf,'position',[x0,y0,width,height])

saveCurrentFigure('Figure4');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure4.png" in the "results" folder.');
disp('====================================================');
