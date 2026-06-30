function Figure6S(I2)

load('../data/CompactData/Figure6S_Stats.mat','Figure6SData')

sub = I2;
if length(sub) ~= 1
    error('invalid selection')
end

if ismember(sub, Figure6SData.SelectedExp)
    k = find(Figure6SData.SelectedExp == sub, 1);
elseif ismember(sub, 1:numel(Figure6SData.SelectedExp))
    k = sub;
else
    error('invalid selection. Available original experiment indices are: %s', ...
        mat2str(Figure6SData.SelectedExp))
end

t = Figure6SData.Time;
D = Figure6SData.Exp(k);

m_fb = D.m_fb;
m_h  = D.m_h;
m_th = D.m_th;
m_sh = D.m_sh;
m_f  = D.m_f;

disp(['Total mass = ', num2str(D.TotalMass)]);

figure(15)
clf
hold on

p1 = plot(t,m_fb,'r', 'LineStyle','-', 'Marker','none','LineWidth',2);
p2 = plot(t,m_h,'color',[0,0.6,0], 'LineStyle','-', 'Marker','none','LineWidth',2);
p3 = plot(t,m_th,'b', 'LineStyle','-', 'Marker','none','LineWidth',2);
p4 = plot(t,m_sh,'k', 'LineStyle','-', 'Marker','none','LineWidth',2);
p5 = plot(t,m_f,'color',[0.6,0.5,0.05], 'LineStyle','-', 'Marker','none','LineWidth',2);

grid on
box on
xlabel('Time [s]')
ylabel('m [kg]')

legend([p1 p2 p3 p4 p5], ...
    '$m_{fb}$','$m_h$','$m_{th}$','$m_{sh}$','$m_f$', ...
    'Interpreter','Latex','NumColumns',5);

xlim([0.0 13])
ylim([0 30])

set(gca,'FontName','Times New Roman','FontSize',12,'LineWidth',1)

hold off

ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle = '-';

pos = get(ax,'Position');
set(ax,'Position',[pos(1) pos(2) pos(3)+0.04 pos(4)]);

outFolder = '../results/supplementary';
if ~exist(outFolder,'dir')
    mkdir(outFolder);
end

print(gcf, fullfile(outFolder, 'Figure6S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure6S.png" in the "results/supplementary" folder.');
disp('====================================================');

end
