clear; clc;

%% ============================================================
% Settings
% ============================================================

rawFolder = fullfile('..','data');
outFolder = fullfile(rawFolder,'FilteredData');

if ~exist(outFolder,'dir')
    mkdir(outFolder);
end

wc = 10;   % rad/s

%% ============================================================
% Load time vector
% ============================================================

S = load(fullfile(rawFolder,'Time.mat'));
Time = S.t;

dt = mean(diff(Time));

fprintf('dt = %.6f s\n',dt);
fprintf('wc = %.2f rad/s\n',wc);
fprintf('Equivalent cutoff frequency = %.3f Hz\n',wc/(2*pi));
fprintf('Approximate time constant = %.3f s\n\n',1/wc);

% Save time vector unchanged
t = Time;
save(fullfile(outFolder,'Time.mat'),'t');

%% ============================================================
% Files to filter
% ============================================================

files = {
    'IxxFb.mat'
    'IyyFb.mat'
    'IzzFb.mat'
    'IxyFb.mat'
    'IxzFb.mat'
    'IyzFb.mat'

    'Ixxh.mat'
    'Iyyh.mat'
    'Izzh.mat'
    'Ixyh.mat'
    'Ixzh.mat'
    'Iyzh.mat'

    'Ixxth.mat'
    'Iyyth.mat'
    'Izzth.mat'
    'Ixyth.mat'
    'Ixzth.mat'
    'Iyzth.mat'

    'Ixxsh.mat'
    'Iyysh.mat'
    'Izzsh.mat'
    'Ixysh.mat'
    'Ixzsh.mat'
    'Iyzsh.mat'

    'IxxF.mat'
    'IyyF.mat'
    'IzzF.mat'
    'IxyF.mat'
    'IxzF.mat'
    'IyzF.mat'

    'hx_fb.mat'
    'hy_fb.mat'
    'hz_fb.mat'

    'hx_h.mat'
    'hy_h.mat'
    'hz_h.mat'

    'hx_th.mat'
    'hy_th.mat'
    'hz_th.mat'

    'hx_sh.mat'
    'hy_sh.mat'
    'hz_sh.mat'

    'hx_f.mat'
    'hy_f.mat'
    'hz_f.mat'

    'm_fb.mat'
    'm_h.mat'
    'm_th.mat'
    'm_sh.mat'
    'm_f.mat'
    };

%% ============================================================
% Filter every raw parameter file
% ============================================================

for n = 1:numel(files)

    inFile = fullfile(rawFolder,files{n});

    fprintf('Filtering: %s\n',files{n});

    % Load .mat file
    S = load(inFile);

    % Each file contains one variable
    names = fieldnames(S);

    if numel(names) ~= 1
        error('%s contains more than one variable.',files{n});
    end

    varName = names{1};
    X = S.(varName);

    % Remember original dimensions
    originalSize = size(X);

    % --------------------------------------------------------
    % Convert:
    %
    %   time × subject × velocity
    %
    % into:
    %
    %   time × (subject*velocity)
    %
    % This lets the filter process all 12×6 experiments
    % simultaneously.
    % --------------------------------------------------------

    X2 = reshape(X,size(X,1),[]);

    % Filter every subject/velocity time series
    X2_f = filter_inertial_params(X2,dt,wc);

    % Restore original organization
    X_f = reshape(X2_f,originalSize);

    % --------------------------------------------------------
    % Save using EXACTLY the original variable name
    % --------------------------------------------------------

    Sout = struct();
    Sout.(varName) = X_f;

    save(fullfile(outFolder,files{n}), ...
         '-struct','Sout','-v7');

end

fprintf('\n============================================\n');
fprintf('Filtering completed successfully.\n');
fprintf('Filtered data saved in:\n%s\n',outFolder);
fprintf('============================================\n');



function X_f = filter_inertial_params(X,dt,wc)

alpha = 1/(1 + wc*dt);

X_f = zeros(size(X));
X_f(1,:) = X(1,:);

for k = 2:size(X,1)
    X_f(k,:) = alpha*X_f(k-1,:) + ...
               (1-alpha)*X(k,:);
end

end