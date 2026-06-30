function Figure8()

load('../data/CompactData/Figure8_Stats.mat','Stats')

t = Stats.Figure8.t;

ErrMean_Prop = Stats.Figure8.ErrMean_Prop;
ErrStd_Prop  = Stats.Figure8.ErrStd_Prop;

ErrMean_RSDP = Stats.Figure8.ErrMean_RSDP;
ErrStd_RSDP  = Stats.Figure8.ErrStd_RSDP;

CTime_Prop_m = Stats.Figure8.CTime_Prop_m;
CTime_Prop_s = Stats.Figure8.CTime_Prop_s;

CTime_RSDP_m = Stats.Figure8.CTime_RSDP_m;
CTime_RSDP_s = Stats.Figure8.CTime_RSDP_s;

X_SP = [0 13];

C = [0.98,0.71,0.82;
     0.6,1,0;
     0.5,0.85,1;
     0.8,0.8,0.8];

figure(8)
clf

subplot(2,1,1)
hold on
plot_patch_std(t, ErrMean_Prop, ErrStd_Prop, C(1,:));
plot_patch_std(t, ErrMean_RSDP, ErrStd_RSDP, C(2,:));

p1 = plot(t,ErrMean_Prop,'r-','LineWidth',2);
p2 = plot(t,ErrMean_RSDP,'Color',[0.0,0.6,0],'LineWidth',2);

legend([p1 p2],'Proposed','RSDP','Location','northeast','NumColumns',1);
grid on
box on

xlim(X_SP);
ylabel('e_{\tau} [N.m]')
set(gca,'XTickLabel',[]);
set(gca,'FontName','Times New Roman','FontSize',12,'LineWidth',1)

a_pos = get(gca,'Position');
set(gca,'Position',[a_pos(1) a_pos(2)-0.02 a_pos(3)+0.05 a_pos(4)+0.07])

subplot(2,1,2)
hold on
plot_patch_std(t, CTime_Prop_m, CTime_Prop_s, C(1,:));
plot_patch_std(t, CTime_RSDP_m, CTime_RSDP_s, C(2,:));

p1 = plot(t,CTime_Prop_m,'r-','LineWidth',2);
p2 = plot(t,CTime_RSDP_m,'Color',[0.0,0.6,0],'LineWidth',2);

legend([p1 p2],'Proposed','RSDP','Location','northeast','NumColumns',1);
grid on
box on

xlim(X_SP);
ylabel('t_c [ms]')
xlabel('Time [s]')
set(gca,'FontName','Times New Roman','FontSize',12,'LineWidth',1)

a_pos = get(gca,'Position');
set(gca,'Position',[a_pos(1) a_pos(2) a_pos(3)+0.05 a_pos(4)+0.07])

saveCurrentFigure('Figure8');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure8.png" in the "results" folder.');
disp('====================================================');

end
