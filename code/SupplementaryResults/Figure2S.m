function Figure2S(I2)

FolderName = fullfile('../','data');
File = fullfile(FolderName,'Time.mat'); F = load(File); Time = F.t; clear F;
File = fullfile(FolderName,'Acc.mat'); F = load(File); Acc = F.Acc; clear F;

L = length(Time);

S_vec = I2;l = length(S_vec);

if (l>4 || l<4 || max(S_vec)>12 || min(S_vec)<1 )
    error('invalid selection')
else
Acc_avg = zeros(L-1,l); Acc_std = zeros(L-1,l);
Acc_max = zeros(L-1,l); Acc_min = zeros(L-1,l);

for j = 1:l
for i=1:L-1 
    %% Accuracy Computation
    Acc_avg(i,j) = mean(Acc(i,S_vec(j),:));
    Acc_std(i,j) = std(Acc(i,S_vec(j),:));
    Acc_max(i,j) = Acc_avg(i,j) + Acc_std(i,j);
    Acc_min(i,j) = Acc_avg(i,j) - Acc_std(i,j);
end
end

C = [0.98,0.71,0.82;0.48,1,0;0.5,0.85,1;0.8,0.8,0.8];
figure(6)    %Accurracy Plot
hold on
for j = 1:4
for i = 1:L-2    
    y_ct = [Acc_min(i,j) Acc_min(i+1,j) Acc_max(i+1,j) Acc_max(i+1,j)];
    x_ct = [Time(i) Time(i+1) Time(i+1) Time(i)];
    p = patch(x_ct,y_ct,'b');
    p.FaceColor = C(j,:);      
    p.EdgeColor = 'none';
end
end

p1 = plot(Time(1:end-1),Acc_avg(:,1),'r','LineWidth',2);
p2 = plot(Time(1:end-1),Acc_avg(:,2),'color',[0,0.6,0],'LineWidth',2);
p3 = plot(Time(1:end-1),Acc_avg(:,3),'b','LineWidth',2);
p4 = plot(Time(1:end-1),Acc_avg(:,4),'k','LineWidth',2); grid on, box on, grid minor
ylabel('e_{rel}'), xlabel('Time [s]')
legend([p1 p2 p3 p4],{['M_{',num2str(S_vec(1)),'}'],['M_{',num2str(S_vec(2)),'}'],['M_{',num2str(S_vec(3)),'}'],['M_{',num2str(S_vec(4)),'}']},'NumColumns',4);
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)

ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';

xlim([0.3 8]), ylim([0 0.16])
ax.XAxis.MinorTickValues = 0:0.5:8;
ax.YAxis.MinorTickValues = 0:0.025:0.15;
yticks(0:0.05:0.15); xticks(1:7);

hold off

end


print(gcf, fullfile('../results/supplementary', 'Figure2S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure2S.png" in the "results" folder.');
disp('====================================================');

end
