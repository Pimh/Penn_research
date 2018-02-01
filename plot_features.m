function plot_features(S, thrs)
% Plot scatter boxplots of calcium oscillation characteristics from S
% struct

addpath('../not_box_plot')

[mat_exp, mat_non] = struct2mat(S, thrs);

% Subplot 1
ax = subplot(2,3,1);
ax.XTickLabel={'','Exp.','','Non-exp.',''};
title('# of peaks')
notBoxPlot(mat_exp(:,1),1,'jitter',0.5)
notBoxPlot(mat_non(:,1),2,'jitter',0.5)
[p,h] = ranksum(mat_exp(:,1),mat_non(:,1));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)])

% Subplot 2
ax = subplot(2,3,2);
ax.XTickLabel={'','Exp.','','Non-exp.',''};
title('Peak amplitude')
notBoxPlot(mat_exp(:,2),1,'jitter',0.5)
notBoxPlot(mat_non(:,2),2,'jitter',0.5)
[p,h] = ranksum(mat_exp(:,2),mat_non(:,2));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)])

% Subplot 3
ax = subplot(2,3,3);
ax.XTickLabel={'','Exp.','','Non-exp.',''};
title('Peak prominence')
notBoxPlot(mat_exp(:,3),1,'jitter',0.5)
notBoxPlot(mat_non(:,3),2,'jitter',0.5)
[p,h] = ranksum(mat_exp(:,3),mat_non(:,3));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)])

% Subplot 4
if sum(~isnan(mat_exp(:,4))) > 1 & sum(~isnan(mat_non(:,4))) > 1
    ax = subplot(2,3,4);
    ax.XTickLabel={'','Exp.','','Non-exp.',''};
    title('Osc. period')
    notBoxPlot(mat_exp(:,4),1,'jitter',0.5)
    notBoxPlot(mat_non(:,4),2,'jitter',0.5)
    [p,h] = ranksum(mat_exp(:,4),mat_non(:,4));
    text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
            ['p:' num2str(p) ', sig:' num2str(h)])
end  

% Subplot 5
ax = subplot(2,3,5);
ax.XTickLabel={'','Exp.','','Non-exp.',''};
title('Osc. width')
notBoxPlot(mat_exp(:,6),1,'jitter',0.5)
notBoxPlot(mat_non(:,6),2,'jitter',0.5)
[p,h] = ranksum(mat_exp(:,6),mat_non(:,6));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)])