function Figure1S(I2)

FolderName = fullfile('../','data');
File = fullfile(FolderName,'Time.mat'); F = load(File); Time = F.t; clear F;
File = fullfile(FolderName,'Comp_Time.mat'); F = load(File); Comp_Time = F.Comp_Time; clear F;

L = length(Time);

%prompt='Input row vector of 2 robot-human models integer indices from 1 to 12, e.g [1 5]: ';
S_vec = I2; l = length(S_vec);

if (l>2 || l<2 || max(S_vec)>12 || min(S_vec)<1 )
    error('invalid selection')
    else
    Comp_Time_avg = zeros(L-1,l); Comp_Time_std = zeros(L-1,l);
    Comp_Time_max = zeros(L-1,l); Comp_Time_min = zeros(L-1,l);

    for j = 1:l
    for i=1:L-1
        %% Computation Time
            Comp_Time_avg(i,j) = mean(Comp_Time(i,S_vec(j),:));
                Comp_Time_std(i,j) = std(Comp_Time(i,S_vec(j),:));
     Comp_Time_max(i,j) = Comp_Time_avg(i,j) + Comp_Time_std(i,j);
         Comp_Time_min(i,j) = Comp_Time_avg(i,j) - Comp_Time_std(i,j);
         end
         end

         % Plot comp_time for subjects [1 5 7 11]
         figure(5)    %Computation time
         hold on
         C = [0.98,0.71,0.82;0.48,1,0;0.5,0.85,1;0.8,0.8,0.8];
         H=[1 4];
    for j = 1:2
       for i = 1:L-2    
    y_ct = [Comp_Time_min(i,j) Comp_Time_min(i+1,j) Comp_Time_max(i+1,j) Comp_Time_max(i+1,j)];
        x_ct = [Time(i) Time(i+1) Time(i+1) Time(i)];
            p = patch(x_ct,y_ct,'b');
                p.FaceColor = C(H(j),:);      
                    p.EdgeColor = 'none';
                    end
                    end

p1 = plot(Time(1:end-1),Comp_Time_avg(:,1),'r');
p2 = plot(Time(1:end-1),Comp_Time_avg(:,2),'k'); grid on, box on, grid minor
ylabel('t_c [ms]'), xlabel('Time [s]')
xlim([0.3 22]), ylim([50 120])
legend([p1 p2],{['M_{',num2str(S_vec(1)),'}'],['M_{',num2str(S_vec(2)),'}']},'NumColumns',2);
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
hold off

ax = gca;
ax.MinorGridColor = [0 0 1];
ax.MinorGridAlpha = 0.1;
ax.MinorGridLineStyle= '-';

xlim([0.3 22]), ylim([0 40])
ax.XAxis.MinorTickValues = 0:5:30;
ax.YAxis.MinorTickValues = 0:10:40;
yticks(0:20:40); xticks(5:5:20);

end


print(gcf, fullfile('../results/supplementary', 'Figure1S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure1S.png" in the "results" folder.');
disp('====================================================');

end
