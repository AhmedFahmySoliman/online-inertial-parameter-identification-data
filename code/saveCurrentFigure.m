function saveCurrentFigure(name)
    % Save in multiple formats to /results
    print(gcf, fullfile('../results', [name '.png']), '-dpng','-r300');
end