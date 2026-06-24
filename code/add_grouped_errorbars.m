function add_grouped_errorbars(b,Y,E)

ngroups = size(Y,1);
nbars = size(Y,2);

x = nan(nbars,ngroups);

for k = 1:nbars
    x(k,:) = b(k).XEndPoints;
end

errorbar(x', Y, E, 'k', ...
    'LineStyle','none', ...
    'LineWidth',1.2);

end