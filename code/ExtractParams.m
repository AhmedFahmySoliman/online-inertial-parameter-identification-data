function [Time, PI] = ExtractParams(I2,I3)
FolderName = fullfile('../','data');

File = fullfile(FolderName,'Time.mat'); F = load(File); Time = F.t; clear F;

File = fullfile(FolderName,'IxxFb.mat'); F = load(File);  Ixxfb = F.IxxFb; clear F;
File = fullfile(FolderName,'IyyFb.mat');  F = load(File);  Iyyfb = F.IyyFb; clear F;
File = fullfile(FolderName,'IzzFb.mat'); F = load(File);  Izzfb = F.IzzFb; clear F;
File = fullfile(FolderName,'IxyFb.mat'); F = load(File);  Ixyfb = F.IxyFb; clear F;
File = fullfile(FolderName,'IxzFb.mat');  F = load(File);  Ixzfb = F.IxzFb; clear F;
File = fullfile(FolderName,'IyzFb.mat');  F = load(File);  Iyzfb = F.IyzFb; clear F;

File = fullfile(FolderName,'Ixxh.mat'); F = load(File);  Ixxh = F.Ixxh; clear F;
File = fullfile(FolderName,'Iyyh.mat');  F = load(File);  Iyyh = F.Iyyh; clear F;
File = fullfile(FolderName,'Izzh.mat'); F = load(File);  Izzh = F.Izzh; clear F;
File = fullfile(FolderName,'Ixyh.mat'); F = load(File);  Ixyh = F.Ixyh; clear F;
File = fullfile(FolderName,'Ixzh.mat');  F = load(File);  Ixzh = F.Ixzh; clear F;
File = fullfile(FolderName,'Iyzh.mat');  F = load(File);  Iyzh = F.Iyzh; clear F;

File = fullfile(FolderName,'Ixxth.mat'); F = load(File);  Ixxth = F.Ixxth; clear F;
File = fullfile(FolderName,'Iyyth.mat');  F = load(File);  Iyyth = F.Iyyth; clear F;
File = fullfile(FolderName,'Izzth.mat'); F = load(File);  Izzth = F.Izzth; clear F;
File = fullfile(FolderName,'Ixyth.mat'); F = load(File);  Ixyth = F.Ixyth; clear F;
File = fullfile(FolderName,'Ixzth.mat');  F = load(File);  Ixzth = F.Ixzth; clear F;
File = fullfile(FolderName,'Iyzth.mat');  F = load(File);  Iyzth = F.Iyzth; clear F;

File = fullfile(FolderName,'Ixxsh.mat'); F = load(File);  Ixxsh = F.Ixxsh; clear F;
File = fullfile(FolderName,'Iyysh.mat');  F = load(File);  Iyysh = F.Iyysh; clear F;
File = fullfile(FolderName,'Izzsh.mat'); F = load(File);  Izzsh = F.Izzsh; clear F;
File = fullfile(FolderName,'Ixysh.mat'); F = load(File);  Ixysh = F.Ixysh; clear F;
File = fullfile(FolderName,'Ixzsh.mat');  F = load(File);  Ixzsh = F.Ixzsh; clear F;
File = fullfile(FolderName,'Iyzsh.mat');  F = load(File);  Iyzsh = F.Iyzsh; clear F;

File = fullfile(FolderName,'IxxF.mat'); F = load(File);  IxxF = F.IxxF; clear F;
File = fullfile(FolderName,'IyyF.mat');  F = load(File);  IyyF = F.IyyF; clear F;
File = fullfile(FolderName,'IzzF.mat'); F = load(File);  IzzF = F.IzzF; clear F;
File = fullfile(FolderName,'IxyF.mat'); F = load(File);  IxyF = F.IxyF; clear F;
File = fullfile(FolderName,'IxzF.mat');  F = load(File);  IxzF = F.IxzF; clear F;
File = fullfile(FolderName,'IyzF.mat');  F = load(File);  IyzF = F.IyzF; clear F;

File = fullfile(FolderName,'hx_fb.mat'); F = load(File);  hx_fb = F.hx_fb; clear F;
File = fullfile(FolderName,'hy_fb.mat'); F = load(File);  hy_fb = F.hy_fb; clear F;
File = fullfile(FolderName,'hz_fb.mat');  F = load(File); hz_fb = F.hz_fb; clear F;

File = fullfile(FolderName,'hx_th.mat'); F = load(File);  hx_th = F.hx_th; clear F;
File = fullfile(FolderName,'hy_th.mat'); F = load(File);  hy_th = F.hy_th; clear F;
File = fullfile(FolderName,'hz_th.mat');  F = load(File); hz_th = F.hz_th; clear F;

File = fullfile(FolderName,'hx_h.mat'); F = load(File);  hx_h = F.hx_h; clear F;
File = fullfile(FolderName,'hy_h.mat'); F = load(File);  hy_h = F.hy_h; clear F;
File = fullfile(FolderName,'hz_h.mat');  F = load(File); hz_h = F.hz_h; clear F;

File = fullfile(FolderName,'hx_sh.mat'); F = load(File);  hx_sh = F.hx_sh; clear F;
File = fullfile(FolderName,'hy_sh.mat'); F = load(File);  hy_sh = F.hy_sh; clear F;
File = fullfile(FolderName,'hz_sh.mat');  F = load(File); hz_sh = F.hz_sh; clear F;

File = fullfile(FolderName,'hx_f.mat'); F = load(File);  hx_f = F.hx_f; clear F;
File = fullfile(FolderName,'hy_f.mat'); F = load(File);  hy_f = F.hy_f; clear F;
File = fullfile(FolderName,'hz_f.mat');  F = load(File); hz_f = F.hz_f; clear F;

File = fullfile(FolderName,'m_fb.mat'); F = load(File);  m_fb = F.m_fb; clear F;
File = fullfile(FolderName,'m_h.mat');  F = load(File);  m_h = F.m_h; clear F;
File = fullfile(FolderName,'m_th.mat'); F = load(File);  m_th = F.m_th; clear F;
File = fullfile(FolderName,'m_sh.mat'); F = load(File);  m_sh = F.m_sh; clear F;
File = fullfile(FolderName,'m_f.mat');  F = load(File);  m_f = F.m_f; clear F;

L = length(Time);

for i = 1:L-1
    PI(i,1) =  Ixxfb(i,I2,I3); PI(i,2) =  Iyyfb(i,I2,I3); PI(i,3) =  Izzfb(i,I2,I3); PI(i,4) =  Iyzfb(i,I2,I3); PI(i,5) =  Ixzfb(i,I2,I3); PI(i,6) =  Ixzfb(i,I2,I3);
    PI(i,7) =  hx_fb(i,I2,I3); PI(i,8) =  hy_fb(i,I2,I3); PI(i,9) =  hz_fb(i,I2,I3);
    PI(i,10) =  m_fb(i,I2,I3);
    PI(i,11) =  Ixxh(i,I2,I3); PI(i,12) =  Iyyh(i,I2,I3); PI(i,13) =  Izzh(i,I2,I3); PI(i,14) =  Iyzh(i,I2,I3); PI(i,15) =  Ixzh(i,I2,I3); PI(i,16) =  Ixzh(i,I2,I3);
    PI(i,17) =  hx_h(i,I2,I3); PI(i,18) =  hy_h(i,I2,I3); PI(i,19) =  hz_h(i,I2,I3);
    PI(i,20) =  m_h(i,I2,I3);
    PI(i,21) =  Ixxth(i,I2,I3); PI(i,22) =  Iyyth(i,I2,I3); PI(i,23) =  Izzth(i,I2,I3); PI(i,24) =  Iyzth(i,I2,I3); PI(i,25) =  Ixzth(i,I2,I3); PI(i,26) =  Ixzth(i,I2,I3);
    PI(i,27) =  hx_th(i,I2,I3); PI(i,28) =  hy_th(i,I2,I3); PI(i,29) =  hz_th(i,I2,I3);
    PI(i,30) =  m_th(i,I2,I3);
    PI(i,31) =  Ixxsh(i,I2,I3); PI(i,32) =  Iyysh(i,I2,I3); PI(i,33) =  Izzsh(i,I2,I3); PI(i,34) =  Iyzsh(i,I2,I3); PI(i,35) =  Ixzsh(i,I2,I3); PI(i,36) =  Ixzsh(i,I2,I3);
    PI(i,37) =  hx_sh(i,I2,I3); PI(i,38) =  hy_sh(i,I2,I3); PI(i,39) =  hz_sh(i,I2,I3);
    PI(i,40) =  m_sh(i,I2,I3);
    PI(i,41) =  IxxF(i,I2,I3); PI(i,42) =  IyyF(i,I2,I3); PI(i,43) =  IzzF(i,I2,I3); PI(i,44) =  IyzF(i,I2,I3); PI(i,45) =  IxzF(i,I2,I3); PI(i,46) =  IxzF(i,I2,I3);
    PI(i,47) =  hx_f(i,I2,I3); PI(i,48) =  hy_f(i,I2,I3); PI(i,49) =  hz_f(i,I2,I3);
    PI(i,50) =  m_f(i,I2,I3);
end

end