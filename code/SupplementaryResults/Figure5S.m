function Figure5S(I2)

load('../data/CompactData/Figure5S_Stats.mat','Figure5SData')

sub = I2;
if length(sub) ~= 1
    error('invalid selection')
end

if ismember(sub, Figure5SData.SelectedExp)
    k = find(Figure5SData.SelectedExp == sub, 1);
elseif ismember(sub, 1:numel(Figure5SData.SelectedExp))
    k = sub;
else
    error('invalid selection. Available original experiment indices are: %s', ...
        mat2str(Figure5SData.SelectedExp))
end

Time = Figure5SData.Time;

E_fb = Figure5SData.Exp(k).E_fb;
E_h  = Figure5SData.Exp(k).E_h;
E_th = Figure5SData.Exp(k).E_th;
E_sh = Figure5SData.Exp(k).E_sh;
E_f  = Figure5SData.Exp(k).E_f;

figure(14)
clf

a1 = subplot(1,5,1);
plot_eigs_and_triangles(Time,E_fb)
xlim([0.3 13]);
xlabel('Time [s]')
title('\lambda_{fb}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName','Times New Roman','FontSize',14,'LineWidth',1)

a2 = subplot(1,5,2);
plot_eigs_and_triangles(Time,E_h)
xlim([0.3 13]);
xlabel('Time [s]')
title('\lambda_{h}^c [kg.m^2]','Fontweight','default');
legend({'\lambda_1','\lambda_2','\lambda_3'}, ...
       'Location','southeast','NumColumns',3);
set(gca,'FontName','Times New Roman','FontSize',14,'LineWidth',1)

a3 = subplot(1,5,3);
plot_eigs_and_triangles(Time,E_th)
xlim([0.3 13]);
xlabel('Time [s]')
title('\lambda_{th}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName','Times New Roman','FontSize',14,'LineWidth',1)

a4 = subplot(1,5,4);
plot_eigs_and_triangles(Time,E_sh)
xlim([0.3 13]);
xlabel('Time [s]')
title('\lambda_{sh}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName','Times New Roman','FontSize',14,'LineWidth',1)

a5 = subplot(1,5,5);
[p1,p2,p3] = plot_eigs_and_triangles(Time,E_f);
xlim([0.3 13]);
xlabel('Time [s]')
title('\lambda_{f}^c [kg.m^2]','Fontweight','default');
legend([p1 p2 p3], ...
    {'\lambda_1+\lambda_2-\lambda_3', ...
     '\lambda_2+\lambda_3-\lambda_1', ...
     '\lambda_1+\lambda_3-\lambda_2'}, ...
    'Location','northeast');
set(gca,'FontName','Times New Roman','FontSize',14,'LineWidth',1)

a1_pos = get(a1,'Position');
a2_pos = get(a2,'Position');
a3_pos = get(a3,'Position');
a4_pos = get(a4,'Position');
a5_pos = get(a5,'Position');

c = 0.8;

set(a1,'Position',[a1_pos(1)-0.1  a1_pos(2)+0.1 a1_pos(3)+0.04 c*a1_pos(4)]);
set(a2,'Position',[a2_pos(1)-0.07 a2_pos(2)+0.1 a2_pos(3)+0.04 c*a2_pos(4)]);
set(a3,'Position',[a3_pos(1)-0.04 a3_pos(2)+0.1 a3_pos(3)+0.04 c*a3_pos(4)]);
set(a4,'Position',[a4_pos(1)-0.01 a4_pos(2)+0.1 a4_pos(3)+0.04 c*a4_pos(4)]);
set(a5,'Position',[a5_pos(1)+0.02 a5_pos(2)+0.1 a5_pos(3)+0.04 c*a5_pos(4)]);

x0 = 3500; y0 = 150;
width = 1850; height = 500;
set(gcf,'position',[x0,y0,width,height])

outFolder = '../results/supplementary';
if ~exist(outFolder,'dir')
    mkdir(outFolder);
end

print(gcf, fullfile(outFolder, 'Figure5S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure5S.png" in the "results/supplementary" folder.');
disp('====================================================');

end

function [p1,p2,p3] = plot_eigs_and_triangles(Time,E)

plot(Time,E(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time,E(2,:),'color',[0,0.6,0],'LineWidth',2)
plot(Time,E(3,:),'b','LineWidth',2)

p1 = plot(Time,(E(1,:)+E(2,:))-E(3,:),'--r','LineWidth',2);
p2 = plot(Time,(E(3,:)+E(2,:))-E(1,:),'color',[0,0.6,0], ...
    'LineStyle','--','LineWidth',2);
p3 = plot(Time,(E(3,:)+E(1,:))-E(2,:),'--b','LineWidth',2);

hold off

end
