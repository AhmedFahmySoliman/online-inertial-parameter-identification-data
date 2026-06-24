clear, clc, close all

FolderName = fullfile('..','data/');
File = fullfile(FolderName,'Time_g.mat'); F = load(File); Time = F.Time_g; clear F;

File = fullfile(FolderName,'Acc_g2.mat'); F = load(File);  Acc_g = F.Acc_g2; clear F;
File = fullfile(FolderName,'Acc_ginf.mat'); F = load(File);  Acc_ginf = F.Acc_ginf; clear F;
End = size(Acc_g,1);
t = Time(1:End);

    for i=1:End
    Acc_ginf_avg(i,1) = mean(Acc_ginf(i,:));
    Acc_ginf_std(i,1) = std(Acc_ginf(i,:));
    Acc_ginf_max(i,1) = Acc_ginf_avg(i) + Acc_ginf_std(i);
    Acc_ginf_min(i,1) = Acc_ginf_avg(i) - Acc_ginf_std(i);
    end

    for g = 1:size(Acc_g,3)
    for i=1:End
    Acc_g_avg(i,g) = mean(Acc_g(i,:,g));
    Acc_g_std(i,g) = std(Acc_g(i,:,g));
    Acc_g_max(i,g) = Acc_g_avg(i,g) + Acc_g_std(i,g);
    Acc_g_min(i,g) = Acc_g_avg(i,g) - Acc_g_std(i,g);
    end
    end

    for g = 1:size(Acc_g,3)
    for s=1:size(Acc_g,2)
    Acc_grms(s,g) = rms(Acc_g(:,s,g));
    end
    Acc_grms_mean(g) = mean(Acc_grms(:,g));
    Acc_grms_std(g)  = std(Acc_grms(:,g));
    end
G = [0.1 0.4 0.7 1 4 7 10 40 70 100];

F = figure(1);
a1 = subplot(1,2,1);
hold on
C = [0.98,0.71,0.82;0.48,1,0;0.5,0.85,1;0.8,0.8,0.8;1,0.8,0.2];

for i = 1:End-1    %SD
    y_ct = [Acc_ginf_min(i,1) Acc_ginf_min(i+1,1) Acc_ginf_max(i+1,1) Acc_ginf_max(i+1,1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(1,:);
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
p1 = plot(t(1:end),Acc_ginf_avg(:,1),'r', 'LineStyle','-', 'Marker', 'none','LineWidth',2);
ax = gca;


for i = 1:End-1    %SD
    y_ct = [Acc_g_min(i,1) Acc_g_min(i+1,1) Acc_g_max(i+1,1) Acc_g_max(i+1,1)];
    x_ct = [t(i) t(i+1) t(i+1) t(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(3,:);
    p.FaceAlpha = 0.6;
    p.EdgeColor = 'none';
end
p2 = plot(t(1:end),Acc_g_avg(:,1),'b', 'LineStyle','-', 'Marker', 'none','LineWidth',2);
grid on, box on, grid minor
ylabel('e_{rel}','FontWeight','normal'), 
xlabel('Time [s]')
set(gca,'FontName', 'Times New Roman','FontSize', 34,'LineWidth',3)
h= legend([p1 p2],{'\gamma=\infty Hz','\gamma=1 Hz'},'NumColumns',2,'Location','Northeast');

ax = gca;
set(ax, 'Yscale','log')
ylim([0.002 5]), xlim([0.05 10]); 
ax.YAxis.Exponent = -1;
ax.MinorGridLineStyle= '-';
ax.MinorGridLineStyle= '-';
ax.MinorGridAlpha = 0.1;
ax.XAxis.MinorTickValues = 0:10;
ax.YAxis.MinorTickValues = [0.001:0.001:0.009 0.01:0.01:0.09 0.1:0.1:0.9 1:9];
yticks([10^-2 1]); xticks(0:2:10);

a2 = subplot(1,2,2);
hold on, grid on, box on, grid minor
errorbar(G,Acc_grms_mean,Acc_grms_std,"-s","MarkerSize",6,"MarkerEdgeColor","blue","MarkerFaceColor",[0.65 0.85 0.90],'LineWidth',2)
ylabel('e_{rel}','FontWeight','normal'), 
xlabel('\gamma [Hz]')
set(gca,'FontName', 'Times New Roman','FontSize', 34,'LineWidth',3)

ax = gca;
set(ax, 'Xscale','log')
xlim([0.09 110]), ylim([-0.01 0.11]); 
ax.YAxis.Exponent = -2;
ax.MinorGridLineStyle= '-';
ax.MinorGridLineStyle= '-';
ax.MinorGridAlpha = 0.1;
ax.XAxis.MinorTickValues = [0.01:0.01:0.09 0.1:0.1:0.9 1:9 (1:9)*10];
ax.YAxis.MinorTickValues = 0:0.01:0.1;
yticks(0:0.05:0.1); xticks([0.1 1 10 100]);


a1_pos = get(a1,'Position'); a2_pos = get(a2,'Position');
c = 0.85;
set(a1,'Position',[a1_pos(1)-0.03 a1_pos(2)+0.09 a1_pos(3)+0.06 c*a1_pos(4)]);
set(a2,'Position',[a2_pos(1)+0.0 a2_pos(2)+0.09 a2_pos(3)+0.06 c*a2_pos(4)]);
x0 = 50; y0 = 150;
width = 1900; height = 720;
set(gcf,'position',[x0,y0,width,height])


saveCurrentFigure('Figure3');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure3.png" in the "results" folder.');
disp('====================================================');
