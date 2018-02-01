function plot_features_multi(cellS, thrs, feat, labels)
% Plot scatter boxplot of a specified feature feat compared between multiple conditions
% thrs is an expression gate. The cell signals with expression above thrs will be plottd 
% feat takes an integer corresponding to the signal feature to be plotted
% 1: # of peak, 2: amplitude, 3: prominence, 4:osc. period, 6: osc. width
% labels take a string array indicating conditions to be plotted

addpath('../not_box_plot')
label =  {'# of peak', 'amplitude', 'prominence', 'osc. period','', 'osc. width'};

for i = 1:numel(cellS)
    [mat_exp, ~] = struct2mat(cellS{i}, thrs(i));
    notBoxPlot(mat_exp(:, feat), i, 'jitter', 0.5)
end
ax = gca;
ax.XTickLabels = labels;
ylabel(label{feat})
