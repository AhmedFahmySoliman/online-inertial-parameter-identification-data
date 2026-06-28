function Figure5S(I2)

load('../data/CompactData/Hardware_Compact_All.mat','Compact')

Data_Prop = Compact.Prop;
Time = Compact.Time{1};

IxxFb = Data_Prop(I2).PI(:,1); IyyFb = Data_Prop(I2).PI(:,2); IzzFb = Data_Prop(I2).PI(:,3);
IyzFb = Data_Prop(I2).PI(:,4); IxzFb = Data_Prop(I2).PI(:,5); IxyFb = Data_Prop(I2).PI(:,6);
hx_fb = Data_Prop(I2).PI(:,7); hy_fb = Data_Prop(I2).PI(:,8); hz_fb = Data_Prop(I2).PI(:,9);
m_fb  = Data_Prop(I2).PI(:,10);

Ixxh = Data_Prop(I2).PI(:,11); Iyyh = Data_Prop(I2).PI(:,12); Izzh = Data_Prop(I2).PI(:,13);
Iyzh = Data_Prop(I2).PI(:,14); Ixzh = Data_Prop(I2).PI(:,15); Ixyh = Data_Prop(I2).PI(:,16);
hx_h = Data_Prop(I2).PI(:,17); hy_h = Data_Prop(I2).PI(:,18); hz_h = Data_Prop(I2).PI(:,19);
m_h  = Data_Prop(I2).PI(:,20);

Ixxth = Data_Prop(I2).PI(:,21); Iyyth = Data_Prop(I2).PI(:,22); Izzth = Data_Prop(I2).PI(:,23);
Iyzth = Data_Prop(I2).PI(:,24); Ixzth = Data_Prop(I2).PI(:,25); Ixyth = Data_Prop(I2).PI(:,26);
hx_th = Data_Prop(I2).PI(:,27); hy_th = Data_Prop(I2).PI(:,28); hz_th = Data_Prop(I2).PI(:,29);
m_th  = Data_Prop(I2).PI(:,30);

Ixxsh = Data_Prop(I2).PI(:,31); Iyysh = Data_Prop(I2).PI(:,32); Izzsh = Data_Prop(I2).PI(:,33);
Iyzsh = Data_Prop(I2).PI(:,34); Ixzsh = Data_Prop(I2).PI(:,35); Ixysh = Data_Prop(I2).PI(:,36);
hx_sh = Data_Prop(I2).PI(:,37); hy_sh = Data_Prop(I2).PI(:,38); hz_sh = Data_Prop(I2).PI(:,39);
m_sh  = Data_Prop(I2).PI(:,40);

IxxF = Data_Prop(I2).PI(:,41); IyyF = Data_Prop(I2).PI(:,42); IzzF = Data_Prop(I2).PI(:,43);
IyzF = Data_Prop(I2).PI(:,44); IxzF = Data_Prop(I2).PI(:,45); IxyF = Data_Prop(I2).PI(:,46);
hx_f = Data_Prop(I2).PI(:,47); hy_f = Data_Prop(I2).PI(:,48); hz_f = Data_Prop(I2).PI(:,49);
m_f  = Data_Prop(I2).PI(:,50);


L = length(Time);

for i = 1:L
    I_fb = I_Tensor([IxxFb(i) IyyFb(i) IzzFb(i) IyzFb(i) IxzFb(i) IxyFb(i)])-(1/m_fb(i))*skew(hx_fb(i),hy_fb(i),hz_fb(i))'*skew(hx_fb(i),hy_fb(i),hz_fb(i));
    I_h  = I_Tensor([Ixxh(i) Iyyh(i) Izzh(i) Iyzh(i) Ixzh(i) Ixyh(i)])-(1/m_h(i))*skew(hx_h(i),hy_h(i),hz_h(i))'*skew(hx_h(i),hy_h(i),hz_h(i));
    I_th = I_Tensor([Ixxth(i) Iyyth(i) Izzth(i) Iyzth(i) Ixzth(i) Ixyth(i)])-(1/m_th(i))*skew(hx_th(i),hy_th(i),hz_th(i))'*skew(hx_th(i),hy_th(i),hz_th(i));
    I_sh = I_Tensor([Ixxsh(i) Iyysh(i) Izzsh(i) Iyzsh(i) Ixzsh(i) Ixysh(i)])-(1/m_sh(i))*skew(hx_sh(i),hy_sh(i),hz_sh(i))'*skew(hx_sh(i),hy_sh(i),hz_sh(i));
    I_f  = I_Tensor([IxxF(i) IyyF(i) IzzF(i) IyzF(i) IxzF(i) IxyF(i)])-(1/m_f(i))*skew(hx_f(i),hy_f(i),hz_f(i))'*skew(hx_f(i),hy_f(i),hz_f(i));
    
    E_fb(1:3,i) = sort(eig(I_fb)); E_h(1:3,i) = sort(eig(I_h)); E_th(1:3,i) = sort(eig(I_th)); E_sh(1:3,i) = sort(eig(I_sh)); E_f(1:3,i) = sort(eig(I_f));
end

figure(14)
a1 = subplot(1,5,1);
plot(Time,E_fb(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time,E_fb(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time,E_fb(3,:),'b','LineWidth',2)

plot(Time,(E_fb(1,:)+E_fb(2,:))-E_fb(3,:),'--r','LineWidth',2),
plot(Time,(E_fb(3,:)+E_fb(2,:))-E_fb(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2),
plot(Time,(E_fb(3,:)+E_fb(1,:))-E_fb(2,:),'--b','LineWidth',2), hold off
xlim([0.3 13]);
xlabel('Time [s]'), title('\lambda_{fb}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName', 'Times New Roman','FontSize', 14,'LineWidth',1)

a2 = subplot(1,5,2);
plot(Time,E_h(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time,E_h(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time,E_h(3,:),'b','LineWidth',2), 
plot(Time,(E_h(1,:)+E_h(2,:))-E_h(3,:),'--r','LineWidth',2),
plot(Time,(E_h(3,:)+E_h(2,:))-E_h(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2),
plot(Time,(E_h(3,:)+E_h(1,:))-E_h(2,:),'--b','LineWidth',2), hold off
xlim([0.3 13]);
xlabel('Time [s]'), title('\lambda_{h}^c [kg.m^2]','Fontweight','default');
legend({'\lambda_1','\lambda_2','\lambda_3'},'Location','southeast','NumColumns',3);
set(gca,'FontName', 'Times New Roman','FontSize', 14,'LineWidth',1)

a3 = subplot(1,5,3);
plot(Time,E_th(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time,E_th(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time,E_th(3,:),'b','LineWidth',2), 
plot(Time,(E_th(1,:)+E_th(2,:))-E_th(3,:),'--r','LineWidth',2), 
plot(Time,(E_th(3,:)+E_th(2,:))-E_th(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2),
plot(Time,(E_th(3,:)+E_th(1,:))-E_th(2,:),'--b','LineWidth',2), hold off

xlim([0.3 13]);
xlabel('Time [s]'), title('\lambda_{th}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName', 'Times New Roman','FontSize', 14,'LineWidth',1)

a4 = subplot(1,5,4);
plot(Time,E_sh(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time,E_sh(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time,E_sh(3,:),'b','LineWidth',2), 
plot(Time,(E_sh(1,:)+E_sh(2,:))-E_sh(3,:),'--r','LineWidth',2); 
plot(Time,(E_sh(3,:)+E_sh(2,:))-E_sh(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2);
plot(Time,(E_sh(3,:)+E_sh(1,:))-E_sh(2,:),'--b','LineWidth',2);hold off
xlim([0.3 13]);
xlabel('Time [s]'), title('\lambda_{sh}^c [kg.m^2]','Fontweight','default');
set(gca,'FontName', 'Times New Roman','FontSize', 14,'LineWidth',1)

a5 = subplot(1,5,5);
plot(Time,E_f(1,:),'r','LineWidth',2), hold on, grid on, grid minor, box on
plot(Time,E_f(2,:),'color',[0,0.6,0],'LineWidth',2),
plot(Time,E_f(3,:),'b','LineWidth',2), 
p1 = plot(Time,(E_f(1,:)+E_f(2,:))-E_f(3,:),'--r','LineWidth',2);
p2 = plot(Time,(E_f(3,:)+E_f(2,:))-E_f(1,:),'color',[0,0.6,0],'LineStyle','--','LineWidth',2);
p3 = plot(Time,(E_f(3,:)+E_f(1,:))-E_f(2,:),'--b','LineWidth',2);hold off
xlim([0.3 13]);
xlabel('Time [s]'), title('\lambda_{f}^c [kg.m^2]','Fontweight','default');
legend([p1 p2 p3],{'\lambda_1+\lambda_2-\lambda_3','\lambda_2+\lambda_3-\lambda_1','\lambda_1+\lambda_3-\lambda_2'},'Location','northeast');
set(gca,'FontName', 'Times New Roman','FontSize', 14,'LineWidth',1)

a1_pos = get(a1,'Position'); a2_pos = get(a2,'Position'); a3_pos = get(a3,'Position');a4_pos = get(a4,'Position');
a5_pos = get(a5,'Position');

c = 0.8;

set(a1,'Position',[a1_pos(1)-0.1 a1_pos(2)+0.1 a1_pos(3)+0.04 c*a1_pos(4)]);
set(a2,'Position',[a2_pos(1)-0.07 a2_pos(2)+0.1 a2_pos(3)+0.04 c*a2_pos(4)]);
set(a3,'Position',[a3_pos(1)-0.04 a3_pos(2)+0.1 a3_pos(3)+0.04 c*a3_pos(4)]);
set(a4,'Position',[a4_pos(1)-0.01 a4_pos(2)+0.1 a4_pos(3)+0.04 c*a4_pos(4)]);
set(a5,'Position',[a5_pos(1)+0.02 a5_pos(2)+0.1 a5_pos(3)+0.04 c*a5_pos(4)]);

x0 = 3500; y0 = 150;
width = 1850; height = 500;
set(gcf,'position',[x0,y0,width,height])

print(gcf, fullfile('../results', 'Figure5S.png'), '-dpng','-r300');

disp('====================================================');
disp(' Figure saved successfully!');
disp(' Please, display the results by left clicking');
disp('  "Figure5S.png" in the "results" folder.');
disp('====================================================');

end
