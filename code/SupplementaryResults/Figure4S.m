function Figure4S(I2)

FolderName = fullfile('../','data');

File = fullfile(FolderName,'Time.mat'); F = load(File); Time = F.t; clear F;

File = fullfile(FolderName,'m_fb.mat'); F = load(File);  m_fb = F.m_fb; clear F;
File = fullfile(FolderName,'m_h.mat');  F = load(File);  m_h = F.m_h; clear F;
File = fullfile(FolderName,'m_th.mat'); F = load(File);  m_th = F.m_th; clear F;
File = fullfile(FolderName,'m_sh.mat'); F = load(File);  m_sh = F.m_sh; clear F;
File = fullfile(FolderName,'m_f.mat');  F = load(File);  m_f = F.m_f; clear F;

s = I2;l = length(s);

if (l~=1 || s>12 || s<1 )
    error('invalid selection')
end

L = length(Time);

    for i=1:L-1
    m_fb_avg(i,1) = mean(m_fb(i,s,:));
    m_fb_std(i,1) = std(m_fb(i,s,:));
    m_fb_max(i,1) = m_fb_avg(i,1) + m_fb_std(i,1);
    m_fb_min(i,1) = m_fb_avg(i,1) - m_fb_std(i,1);
    m_h_avg(i,1) = mean(m_h(i,s,:));
    m_h_std(i,1) = std(m_h(i,s,:));
    m_h_max(i,1) = m_h_avg(i,1) + m_h_std(i,1);
    m_h_min(i,1) = m_h_avg(i,1) - m_h_std(i,1);
    m_th_avg(i,1) = mean(m_th(i,s,:));
    m_th_std(i,1) = std(m_th(i,s,:));
    m_th_max(i,1) = m_th_avg(i,1) + m_th_std(i,1);
    m_th_min(i,1) = m_th_avg(i,1) - m_th_std(i,1);
    m_sh_avg(i,1) = mean(m_sh(i,s,:));
    m_sh_std(i,1) = std(m_sh(i,s,:));
    m_sh_max(i,1) = m_sh_avg(i,1) + m_sh_std(i,1);
    m_sh_min(i,1) = m_sh_avg(i,1) - m_sh_std(i,1);
    m_f_avg(i,1) = mean(m_f(i,s,:));
    m_f_std(i,1) = std(m_f(i,s,:));
    m_f_max(i,1) = m_f_avg(i,1) + m_f_std(i,1);
    m_f_min(i,1) = m_f_avg(i,1) - m_f_std(i,1);
    end
    
    
figure(9)    
hold on
C = [0.98,0.71,0.82;0.48,1,0;0.5,0.85,1;0.8,0.8,0.8;1,0.8,0.2];
% L = length(t)-1;

yyaxis right
for i = 1:L-2    %SD
    y_ct = [m_fb_min(i,1) m_fb_min(i+1,1) m_fb_max(i+1,1) m_fb_max(i+1,1)];
    x_ct = [Time(i) Time(i+1) Time(i+1) Time(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(1,:);      
    p.EdgeColor = 'none';
end

yyaxis left
for i = 1:L-2    %SD
    y_ct = [m_h_min(i,1) m_h_min(i+1,1) m_h_max(i+1,1) m_h_max(i+1,1)];
    x_ct = [Time(i) Time(i+1) Time(i+1) Time(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(2,:);      
    p.EdgeColor = 'none';
end
for i = 1:L-2    %SD
    y_ct = [m_th_min(i,1) m_th_min(i+1,1) m_th_max(i+1,1) m_th_max(i+1,1)];
    x_ct = [Time(i) Time(i+1) Time(i+1) Time(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(3,:);      
    p.EdgeColor = 'none';
end
for i = 1:L-2    %SD
    y_ct = [m_sh_min(i,1) m_sh_min(i+1,1) m_sh_max(i+1,1) m_sh_max(i+1,1)];
    x_ct = [Time(i) Time(i+1) Time(i+1) Time(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(4,:);      
    p.EdgeColor = 'none';
end
for i = 1:L-2    %SD
    y_ct = [m_f_min(i,1) m_f_min(i+1,1) m_f_max(i+1,1) m_f_max(i+1,1)];
    x_ct = [Time(i) Time(i+1) Time(i+1) Time(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(5,:);      
    p.EdgeColor = 'none';
end

yyaxis right
p1 = plot(Time(1:end-1),m_fb_avg(:,1),'r', 'LineStyle','-', 'Marker', 'none','LineWidth',1);
ylim([0 90])
ylabel('m_{fb} [kg]')
ax = gca;
ax.YColor = 'r';

yyaxis left
ax = gca;
ax.YColor = 'k';
p2 = plot(Time(1:end-1),m_h_avg(:,1),'color',[0,0.6,0], 'LineStyle','-', 'Marker', 'none','LineWidth',1);
p3 = plot(Time(1:end-1),m_th_avg(:,1),'b', 'LineStyle','-', 'Marker', 'none','LineWidth',1);
p4 = plot(Time(1:end-1),m_sh_avg(:,1),'k', 'LineStyle','-', 'Marker', 'none','LineWidth',1);
p5 = plot(Time(1:end-1),m_f_avg(:,1),'color',[0.6,0.5,0.05], 'LineStyle','-', 'Marker', 'none','LineWidth',1);grid on, grid minor, box on
ylabel('(m_h, m_{th}, m_{sh}, m_f) [kg]'), xlabel('Time [s]')
legend([p1 p2 p3 p4 p5],{'m_{fb}','m_h','m_{th}','m_{sh}','m_f'},'NumColumns',5);
xlim([0.35 15]), ylim([0 35])
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
hold off

print(gcf, fullfile('../results', 'Figure4S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure4S.png" in the "results" folder.');
disp('====================================================');

end
