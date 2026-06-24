function Figure6S(I2)

load('../data/CompactData/Hardware_Compact_All.mat','Compact')

Data_Prop = Compact.Prop;
t = Compact.Time{1};

m_fb  = Data_Prop(I2).PI(:,10);
m_h  = Data_Prop(I2).PI(:,20);
m_th  = Data_Prop(I2).PI(:,30);
m_sh  = Data_Prop(I2).PI(:,40);
m_f  = Data_Prop(I2).PI(:,50);

figure(15)
clf
hold on
C = [0.98,0.71,0.82;0.48,1,0;0.5,0.85,1;0.8,0.8,0.8;1,0.8,0.2];
p1 = plot(t,m_fb,'r', 'LineStyle','-', 'Marker', 'none','LineWidth',2);
p2 = plot(t,m_h,'color',[0,0.6,0], 'LineStyle','-', 'Marker', 'none','LineWidth',2);
p3 = plot(t,m_th,'b', 'LineStyle','-', 'Marker', 'none','LineWidth',2);
p4 = plot(t,m_sh,'k', 'LineStyle','-', 'Marker', 'none','LineWidth',2);
p5 = plot(t,m_f,'color',[0.6,0.5,0.05], 'LineStyle','-', 'Marker', 'none','LineWidth',2);grid on, box on
xlabel('Time [s]'), ylabel('m [kg]')
legend([p1 p2 p3 p4 p5],'$m_{fb}$','$m_h$','$m_{th}$','$m_{sh}$','$m_f$','Interpreter','Latex','NumColumns',5);
xlim([0.0 13]), ylim([0 30])
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
hold off
ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';

pos = get(ax,'Position');
set(ax,'Position',[pos(1) pos(2) pos(3)+0.04 pos(4)]);


print(gcf, fullfile('../results/supplementary', 'Figure6S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure6S.png" in the "results" folder.');
disp('====================================================');

end
