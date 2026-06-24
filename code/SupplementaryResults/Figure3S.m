function Figure3S(I2, I3)

FolderName = fullfile('..','data');

File = fullfile(FolderName,'Time.mat'); F = load(File); Time = F.t; clear F;

File = fullfile(FolderName,'IxxFb.mat');  F = load(File);  IxxFb = F.IxxFb; clear F;
File = fullfile(FolderName,'IyyFb.mat');  F = load(File);  IyyFb = F.IyyFb; clear F;
File = fullfile(FolderName,'IzzFb.mat');  F = load(File);  IzzFb = F.IzzFb; clear F;
File = fullfile(FolderName,'IyzFb.mat');  F = load(File);  IyzFb = F.IyzFb; clear F;
File = fullfile(FolderName,'IxzFb.mat');  F = load(File);  IxzFb = F.IxzFb; clear F;
File = fullfile(FolderName,'IxyFb.mat');  F = load(File);  IxyFb = F.IxyFb; clear F;
File = fullfile(FolderName,'hx_fb.mat');  F = load(File);  hx_fb = F.hx_fb; clear F;
File = fullfile(FolderName,'hy_fb.mat');  F = load(File);  hy_fb = F.hy_fb; clear F;
File = fullfile(FolderName,'hz_fb.mat');  F = load(File);  hz_fb = F.hz_fb; clear F;
File = fullfile(FolderName,'m_fb.mat');  F = load(File);  m_fb = F.m_fb; clear F;

File = fullfile(FolderName,'Ixxh.mat');  F = load(File);  Ixxh = F.Ixxh; clear F;
File = fullfile(FolderName,'Iyyh.mat');  F = load(File);  Iyyh = F.Iyyh; clear F;
File = fullfile(FolderName,'Izzh.mat');  F = load(File);  Izzh = F.Izzh; clear F;
File = fullfile(FolderName,'Iyzh.mat');  F = load(File);  Iyzh = F.Iyzh; clear F;
File = fullfile(FolderName,'Ixzh.mat');  F = load(File);  Ixzh = F.Ixzh; clear F;
File = fullfile(FolderName,'Ixyh.mat');  F = load(File);  Ixyh = F.Ixyh; clear F;
File = fullfile(FolderName,'hx_h.mat');  F = load(File);  hx_h = F.hx_h; clear F;
File = fullfile(FolderName,'hy_h.mat');  F = load(File);  hy_h = F.hy_h; clear F;
File = fullfile(FolderName,'hz_h.mat');  F = load(File);  hz_h = F.hz_h; clear F;
File = fullfile(FolderName,'m_h.mat');  F = load(File);  m_h = F.m_h; clear F;

File = fullfile(FolderName,'Ixxth.mat');  F = load(File);  Ixxth = F.Ixxth; clear F;
File = fullfile(FolderName,'Iyyth.mat');  F = load(File);  Iyyth = F.Iyyth; clear F;
File = fullfile(FolderName,'Izzth.mat');  F = load(File);  Izzth = F.Izzth; clear F;
File = fullfile(FolderName,'Iyzth.mat');  F = load(File);  Iyzth = F.Iyzth; clear F;
File = fullfile(FolderName,'Ixzth.mat');  F = load(File);  Ixzth = F.Ixzth; clear F;
File = fullfile(FolderName,'Ixyth.mat');  F = load(File);  Ixyth = F.Ixyth; clear F;
File = fullfile(FolderName,'hx_th.mat');  F = load(File);  hx_th = F.hx_th; clear F;
File = fullfile(FolderName,'hy_th.mat');  F = load(File);  hy_th = F.hy_th; clear F;
File = fullfile(FolderName,'hz_th.mat');  F = load(File);  hz_th = F.hz_th; clear F;
File = fullfile(FolderName,'m_th.mat');  F = load(File);  m_th = F.m_th; clear F;

File = fullfile(FolderName,'Ixxsh.mat');  F = load(File);  Ixxsh = F.Ixxsh; clear F;
File = fullfile(FolderName,'Iyysh.mat');  F = load(File);  Iyysh = F.Iyysh; clear F;
File = fullfile(FolderName,'Izzsh.mat');  F = load(File);  Izzsh = F.Izzsh; clear F;
File = fullfile(FolderName,'Iyzsh.mat');  F = load(File);  Iyzsh = F.Iyzsh; clear F;
File = fullfile(FolderName,'Ixzsh.mat');  F = load(File);  Ixzsh = F.Ixzsh; clear F;
File = fullfile(FolderName,'Ixysh.mat');  F = load(File);  Ixysh = F.Ixysh; clear F;
File = fullfile(FolderName,'hx_sh.mat');  F = load(File);  hx_sh = F.hx_sh; clear F;
File = fullfile(FolderName,'hy_sh.mat');  F = load(File);  hy_sh = F.hy_sh; clear F;
File = fullfile(FolderName,'hz_sh.mat');  F = load(File);  hz_sh = F.hz_sh; clear F;
File = fullfile(FolderName,'m_sh.mat');  F = load(File);  m_sh = F.m_sh; clear F;

File = fullfile(FolderName,'IxxF.mat');  F = load(File);  IxxF = F.IxxF; clear F;
File = fullfile(FolderName,'IyyF.mat');  F = load(File);  IyyF = F.IyyF; clear F;
File = fullfile(FolderName,'IzzF.mat');  F = load(File);  IzzF = F.IzzF; clear F;
File = fullfile(FolderName,'IyzF.mat');  F = load(File);  IyzF = F.IyzF; clear F;
File = fullfile(FolderName,'IxzF.mat');  F = load(File);  IxzF = F.IxzF; clear F;
File = fullfile(FolderName,'IxyF.mat');  F = load(File);  IxyF = F.IxyF; clear F;
File = fullfile(FolderName,'hx_f.mat');  F = load(File);  hx_f = F.hx_f; clear F;
File = fullfile(FolderName,'hy_f.mat');  F = load(File);  hy_f = F.hy_f; clear F;
File = fullfile(FolderName,'hz_f.mat');  F = load(File);  hz_f = F.hz_f; clear F;
File = fullfile(FolderName,'m_f.mat');  F = load(File);  m_f = F.m_f; clear F;

L = length(Time);

s = I2;l = length(s);

vel = I3;

if (vel==80)
    v = 1;
elseif (vel==90)
    v = 2;
elseif (vel==100)
    v = 3;
elseif (vel==110)
    v = 4;
elseif (vel==120)
    v = 5;
elseif (vel==130)
    v = 6;
else
   error('invalid selection')
end

if (l~=1 || s>12 || s<1 )
    error('invalid selection')
else
    %% Inertia Tensors Eigen Values
    for i = 50:L-1
    I_fb = I_Tensor([IxxFb(i,s,v) IyyFb(i,s,v) IzzFb(i,s,v) IyzFb(i,s,v) IxzFb(i,s,v) IxyFb(i,s,v)])-(1/m_fb(i,s,v))*skew(hx_fb(i,s,v),hy_fb(i,s,v),hz_fb(i,s,v))'*skew(hx_fb(i,s,v),hy_fb(i,s,v),hz_fb(i,s,v));
    I_h  = I_Tensor([Ixxh(i,s,v) Iyyh(i,s,v) Izzh(i,s,v) Iyzh(i,s,v) Ixzh(i,s,v) Ixyh(i,s,v)])-(1/m_h(i,s,v))*skew(hx_h(i,s,v),hy_h(i,s,v),hz_h(i,s,v))'*skew(hx_h(i,s,v),hy_h(i,s,v),hz_h(i,s,v));
    I_th = I_Tensor([Ixxth(i,s,v) Iyyth(i,s,v) Izzth(i,s,v) Iyzth(i,s,v) Ixzth(i,s,v) Ixyth(i,s,v)])-(1/m_th(i,s,v))*skew(hx_th(i,s,v),hy_th(i,s,v),hz_th(i,s,v))'*skew(hx_th(i,s,v),hy_th(i,s,v),hz_th(i,s,v));
    I_sh = I_Tensor([Ixxsh(i,s,v) Iyysh(i,s,v) Izzsh(i,s,v) Iyzsh(i,s,v) Ixzsh(i,s,v) Ixysh(i,s,v)])-(1/m_sh(i,s,v))*skew(hx_sh(i,s,v),hy_sh(i,s,v),hz_sh(i,s,v))'*skew(hx_sh(i,s,v),hy_sh(i,s,v),hz_sh(i,s,v));
    I_f  = I_Tensor([IxxF(i,s,v) IyyF(i,s,v) IzzF(i,s,v) IyzF(i,s,v) IxzF(i,s,v) IxyF(i,s,v)])-(1/m_f(i,s,v))*skew(hx_f(i,s,v),hy_f(i,s,v),hz_f(i,s,v))'*skew(hx_f(i,s,v),hy_f(i,s,v),hz_f(i,s,v));
    
    E_fb(1:3,i) = sort(eig(I_fb)); E_h(1:3,i) = sort(eig(I_h)); E_th(1:3,i) = sort(eig(I_th)); E_sh(1:3,i) = sort(eig(I_sh)); E_f(1:3,i) = sort(eig(I_f));
    end

    
figure(8)
a1 = subplot(1,5,1);
plot(Time(1:end-1),E_fb(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time(1:end-1),E_fb(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time(1:end-1),E_fb(3,:),'b','LineWidth',2)

plot(Time(1:end-1),(E_fb(1,:)+E_fb(2,:))-E_fb(3,:),'--r','LineWidth',2),
plot(Time(1:end-1),(E_fb(3,:)+E_fb(2,:))-E_fb(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2),
plot(Time(1:end-1),(E_fb(3,:)+E_fb(1,:))-E_fb(2,:),'--b','LineWidth',2), hold off
xlim([0.3 20]);
xlabel('Time [s]'), title('\lambda_{fb}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName', 'Times New Roman','FontSize', 20,'LineWidth',1)

a2 = subplot(1,5,2);
plot(Time(1:end-1),E_h(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time(1:end-1),E_h(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time(1:end-1),E_h(3,:),'b','LineWidth',2), 
plot(Time(1:end-1),(E_h(1,:)+E_h(2,:))-E_h(3,:),'--r','LineWidth',2),
plot(Time(1:end-1),(E_h(3,:)+E_h(2,:))-E_h(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2),
plot(Time(1:end-1),(E_h(3,:)+E_h(1,:))-E_h(2,:),'--b','LineWidth',2), hold off
xlim([0.3 20]);
xlabel('Time [s]'), title('\lambda_{h}^c [kg.m^2]','Fontweight','default');
legend({'\lambda_1','\lambda_2','\lambda_3'},'Location','southeast','NumColumns',3);
set(gca,'FontName', 'Times New Roman','FontSize', 20,'LineWidth',1)

a3 = subplot(1,5,3);
plot(Time(1:end-1),E_th(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time(1:end-1),E_th(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time(1:end-1),E_th(3,:),'b','LineWidth',2), 
plot(Time(1:end-1),(E_th(1,:)+E_th(2,:))-E_th(3,:),'--r','LineWidth',2), 
plot(Time(1:end-1),(E_th(3,:)+E_th(2,:))-E_th(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2),
plot(Time(1:end-1),(E_th(3,:)+E_th(1,:))-E_th(2,:),'--b','LineWidth',2), hold off

xlim([0.3 20]);
xlabel('Time [s]'), title('\lambda_{th}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName', 'Times New Roman','FontSize', 20,'LineWidth',1)

a4 = subplot(1,5,4);
plot(Time(1:end-1),E_sh(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time(1:end-1),E_sh(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time(1:end-1),E_sh(3,:),'b','LineWidth',2), 
plot(Time(1:end-1),(E_sh(1,:)+E_sh(2,:))-E_sh(3,:),'--r','LineWidth',2); 
plot(Time(1:end-1),(E_sh(3,:)+E_sh(2,:))-E_sh(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2);
plot(Time(1:end-1),(E_sh(3,:)+E_sh(1,:))-E_sh(2,:),'--b','LineWidth',2);hold off
xlim([0.3 20]);
xlabel('Time [s]'), title('\lambda_{sh}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName', 'Times New Roman','FontSize', 20,'LineWidth',1)

a5 = subplot(1,5,5);
plot(Time(1:end-1),E_f(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time(1:end-1),E_f(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time(1:end-1),E_f(3,:),'b','LineWidth',2), 
p1 = plot(Time(1:end-1),(E_f(1,:)+E_f(2,:))-E_f(3,:),'--r','LineWidth',2);
p2 = plot(Time(1:end-1),(E_f(3,:)+E_f(2,:))-E_f(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2);
p3 = plot(Time(1:end-1),(E_f(3,:)+E_f(1,:))-E_f(2,:),'--b','LineWidth',2);hold off
xlim([0.3 20]);
xlabel('Time [s]'), title('\lambda_{f}^c [kg.m^2]','Fontweight','default');
legend([p1 p2 p3],{'\lambda_1+\lambda_2-\lambda_3','\lambda_2+\lambda_3-\lambda_1','\lambda_1+\lambda_3-\lambda_2'},'Location','northeast');
set(gca,'FontName', 'Times New Roman','FontSize', 20,'LineWidth',1)

a1_pos = get(a1,'Position'); a2_pos = get(a2,'Position'); a3_pos = get(a3,'Position');a4_pos = get(a4,'Position');
a5_pos = get(a5,'Position');

c = 0.8;

set(a1,'Position',[a1_pos(1)-0.1 a1_pos(2)+0.1 a1_pos(3)+0.04 c*a1_pos(4)]);
set(a2,'Position',[a2_pos(1)-0.07 a2_pos(2)+0.1 a2_pos(3)+0.04 c*a2_pos(4)]);
set(a3,'Position',[a3_pos(1)-0.04 a3_pos(2)+0.1 a3_pos(3)+0.04 c*a3_pos(4)]);
set(a4,'Position',[a4_pos(1)-0.01 a4_pos(2)+0.1 a4_pos(3)+0.04 c*a4_pos(4)]);
set(a5,'Position',[a5_pos(1)+0.02 a5_pos(2)+0.1 a5_pos(3)+0.04 c*a5_pos(4)]);

x0 = 50; y0 = 150;
width = 1850; height = 500;
set(gcf,'position',[x0,y0,width,height])
end


print(gcf, fullfile('../results/supplementary', 'Figure3S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure3S.png" in the "results" folder.');
disp('====================================================');

end