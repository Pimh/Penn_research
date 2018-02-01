function plot_features2(S1, S2, thrs1, thrs2)
% Plot scatter boxplots of calcium oscillation characteristics compared
% between struct S1 and S2

addpath('../not_box_plot')

[mat_exp1, ~] = struct2mat(S1, thrs1);
[mat_exp2, ~] = struct2mat(S2, thrs2);

S1_label = 'WT';
S2_label = 'hRGS2';

% Subplot 1
ax = subplot(2,3,1);
notBoxPlot(mat_exp1(:,1),1,'jitter',0.5)
notBoxPlot(mat_exp2(:,1),2,'jitter',0.5)
[p,h] = ranksum(mat_exp1(:,1),mat_exp2(:,1));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)]) 
ax.XTickLabel = {'',S1_label,'',S2_label,''};
title('# of peaks')

% Subplot 2
ax = subplot(2,3,2);
notBoxPlot(mat_exp1(:,2),1,'jitter',0.5)
notBoxPlot(mat_exp2(:,2),2,'jitter',0.5)
[p,h] = ranksum(mat_exp1(:,2),mat_exp2(:,2));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)]) 
ax.XTickLabel = {'',S1_label,'',S2_label,''};
title('Peak amplitude')

% Subplot 3
ax = subplot(2,3,3);
notBoxPlot(mat_exp1(:,3),1,'jitter',0.5)
notBoxPlot(mat_exp2(:,3),2,'jitter',0.5)
[p,h] = ranksum(mat_exp1(:,3),mat_exp2(:,3));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)]) 
ax.XTickLabel = {'',S1_label,'',S2_label,''};
title('Peak prominence')

% Subplot 4
if (sum(~isnan(mat_exp1(:,4))) > 1) & (sum(~isnan(mat_exp2(:,4))) > 1)
    ax = subplot(2,3,4);
    notBoxPlot(mat_exp1(:,4),1,'jitter',0.5)
    notBoxPlot(mat_exp2(:,4),2,'jitter',0.5)
    [p,h] = ranksum(mat_exp1(:,4),mat_exp2(:,4));
    text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
            ['p:' num2str(p) ', sig:' num2str(h)]) 
    ax.XTickLabel = {'',S1_label,'',S2_label,''};
    title('Osc. period')
end

% Subplot 5
ax = subplot(2,3,5);
notBoxPlot(mat_exp1(:,6),1,'jitter',0.5)
notBoxPlot(mat_exp2(:,6),2,'jitter',0.5)
[p,h] = ranksum(mat_exp1(:,6),mat_exp2(:,6));
text(1, (ax.YLim(2) - ax.YLim(1))*.05 + ax.YLim(1),...
        ['p:' num2str(p) ', sig:' num2str(h)]) 
ax.XTickLabel = {'',S1_label,'',S2_label,''};
title('Osc. width')
