function Figure8()
%Was Figure14
load('../data/CompactData/Hardware_Compact_All.mat','Compact')

Data_Prop = Compact.Prop;
Data_RSDP = Compact.RSDP;

l = length(Data_Prop);
t = Compact.Time{1};

for i = 1:l
    Err_Prop_All(:,:,i) = Data_Prop(i).NTau_est - ...
                          Data_Prop(i).NTau_act;

    Err_RSDP_All(:,:,i) = Data_RSDP(i).NTau_est - ...
                          Data_RSDP(i).NTau_act;

    CTime_Prop(:,i) = Data_Prop(i).Comp_Time_ms;
    CTime_RSDP(:,i) = Data_RSDP(i).Comp_Time_ms;
end
Err_Prop_m = mean(abs(Err_Prop_All),2);
Err_RSDP_m = mean(abs(Err_RSDP_All),2);

Err_Prop_m = squeeze(Err_Prop_m);
Err_RSDP_m = squeeze(Err_RSDP_m);

CTime_Prop_m = mean(CTime_Prop,2,'omitnan');
CTime_RSDP_m = mean(CTime_RSDP,2,'omitnan');

CTime_Prop_s = std(CTime_Prop,0,2,'omitnan');
CTime_RSDP_s = std(CTime_RSDP,0,2,'omitnan');

% ---------- Hardware ----------
ErrMean_Prop = mean(Err_Prop_m,2,'omitnan');
ErrStd_Prop  = std(Err_Prop_m,0,2,'omitnan');

ErrMean_RSDP = mean(Err_RSDP_m,2,'omitnan');
ErrStd_RSDP  = std(Err_RSDP_m,0,2,'omitnan');


X_SP = [0 13]; 
C = [0.98,0.71,0.82;0.6,1,0;0.5,0.85,1;0.8,0.8,0.8];
figure(12)
subplot(2,1,1)
hold on
plot_patch_std(t, ErrMean_Prop, ErrStd_Prop, C(1,:));
plot_patch_std(t, ErrMean_RSDP, ErrStd_RSDP, C(2,:));

p1 = plot(t,ErrMean_Prop,'r-','LineWidth',2);
p2 = plot(t,ErrMean_RSDP,'Color',[0.0,0.6,0],'LineWidth',2);
legend([p1 p2],'Proposed','RSDP','Location','northeast','Numcolumns',1);
grid on, box on
 
xlim(X_SP);
ylabel('e_{\tau} [N.m]')
set(gca,'Xticklabel',[]);
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
a_pos = get(gca,'Position');
set(gca,'Position',[a_pos(1) a_pos(2)-0.02 a_pos(3)+0.05 a_pos(4)+0.07])

subplot(2,1,2)
hold on
plot_patch_std(t, CTime_Prop_m, CTime_Prop_s, C(1,:));
plot_patch_std(t, CTime_RSDP_m, CTime_RSDP_s, C(2,:));

p1 = plot(t,CTime_Prop_m,'r-','LineWidth',2);
p2 = plot(t,CTime_RSDP_m,'Color',[0.0,0.6,0],'LineWidth',2);
legend([p1 p2],'Proposed','RSDP','Location','northeast','Numcolumns',1);
grid on, box on
 
xlim(X_SP);
ylabel('t_c [ms]')
xlabel('Time [s]')
set(gca,'FontName', 'Times New Roman','FontSize', 12,'LineWidth',1)
a_pos = get(gca,'Position');
set(gca,'Position',[a_pos(1) a_pos(2)-0.0 a_pos(3)+0.05 a_pos(4)+0.07])

saveCurrentFigure('Figure8');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure8.png" in the "results" folder.');
disp('====================================================');
end