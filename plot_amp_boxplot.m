function plot_amp_boxplot(amp_ratio_dark,amp_ratio_light,amp_ratio_light_calp2)
% Plot a boxplot of amplitude ratio post- vs. pre-illumination

a = length(amp_ratio_dark);
b = length(amp_ratio_light);
c = length(amp_ratio_light_calp2);
m = max([a; b; c]);

boxplot([[amp_ratio_dark; NaN(m-a,1)], [amp_ratio_light;NaN(m-b,1)], [amp_ratio_light_calp2;NaN(m-c,1)]])
ax = gca;
ax.XTickLabel = {'Dark', 'Light', 'Light-CALP2'};
axis([0.5 3.5 0 2])
ylabel('Amplitude ratio [Post : Pre-illumination]')