function main(i1, i2, i3)

rootDir = fileparts(mfilename('fullpath'));
addpath(fullfile(rootDir,'SupplementaryResults'));

if nargin < 1
    return;
end

clc; close all;

%% One input
if nargin == 1

    if isequal(i1,0)
        return;

    elseif ismember(i1,[1 2 6])
        disp(['Figure ' num2str(i1) ' is not plotted data']);
        return;

    elseif ismember(i1,[3 4 8 10])
        run(['Figure',num2str(i1)])
        return;

    else
        disp('Invalid input argument. Please check the README.');
        return;
    end
end

%% Two inputs
if nargin == 2

    if isequal(i1,7)

        if numel(i2) ~= 1 || ~isIntegerValue(i2) || i2 < 1 || i2 > 4
            disp('Experiment index should be an integer within 1 and 4.');
            return;
        end

        Figure7(i2);
        return;

    elseif isequal(i1,9)

        if numel(i2) ~= 1 || ~isIntegerValue(i2) || i2 < 1 || i2 > 4
            disp('Experiment index should be an integer within 1 and 4.');
            return;
        end

        Figure9(i2);
        return;

    elseif strcmp(i1,'1S')

        if numel(i2) ~= 2 || any(i2 < 1) || any(i2 > 12) || ~all(arrayfun(@isIntegerValue,i2))
            disp('Model indices should be integer values within 1 and 12.');
            return;
        end

        Figure1S(i2);
        return;

    elseif strcmp(i1,'2S')

        if numel(i2) ~= 4 || any(i2 < 1) || any(i2 > 12) || ~all(arrayfun(@isIntegerValue,i2))
            disp('Model indices should be integer values within 1 and 12.');
            return;
        end

        Figure2S(i2);
        return;

        elseif strcmp(i1,'4S')
            if (length(i2) ~= 1)
                disp(['Invalid second input argument. Please check the README ("Figures Description" section) ']);
                return;
            end
            if (ismember(i2,1:12))
                 Figure4S(i2);
            else
                disp([' Model indeces should be integer values less than 13 and greater than 0']);
                return;
            end
          elseif strcmp(i1,'5S')
            if (length(i2) ~= 1)
                disp(['Invalid second input argument. Please check the README ("Figures Description" section) ']);
                return;
            end
            if (ismember(i2,1:4))
                Figure5S(i2);
            else
                disp(['Please enter experiment indexes number from 1 to 4']); 
                return;
            end  
            elseif strcmp(i1,'6S')
            if (length(i2) ~= 1)
                disp(['Invalid second input argument. Please check the README ("Figures Description" section) ']);
                return;
            end
            if (ismember(i2,1:4))
                Figure6S(i2);
            else
                disp(['Please enter experiment indexes number from 1 to 4']); 
                return;
            end
    else
        disp('Invalid input argument. Please check the README.');
        return;
    end
end

%% Three inputs
if nargin == 3

    velocity_vector = [80 90 100 110 120 130];

    if isequal(i1,5)

        if numel(i2) ~= 1 || numel(i3) ~= 2
            disp('Invalid input argument. Please check the README.');
            return;
        end

        if ~isIntegerValue(i2) || i2 < 1 || i2 > 12
            disp('Model index should be an integer within 1 and 12.');
            return;
        end

        if all(ismember(i3,velocity_vector))
            Figure5(i2,i3);
            return;
        else
            disp('Velocity values should be selected from [80 90 100 110 120 130] mm/s.');
            return;
        end

    elseif strcmp(i1,'3S')

        if numel(i2) ~= 1 || numel(i3) ~= 1
            disp('Invalid input argument. Please check the README.');
            return;
        end

        if ~isIntegerValue(i2) || i2 < 1 || i2 > 12
            disp('Model index should be an integer within 1 and 12.');
            return;
        end

        if ~isIntegerValue(i3) || ~ismember(i3,velocity_vector)
            disp('Velocity should be selected from [80 90 100 110 120 130] mm/s.');
            return;
        end

        Figure3S(i2,i3);
        return;

    else
        disp('Invalid input argument. Please check the README.');
        return;
    end
end

end
