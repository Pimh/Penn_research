function plot_bootstat_histogram(bootstat_dark,bootstat_light,bootstat_light_calp)

histogram(bootstat_dark,'Normalization','Probability','BinWidth', 0.03)
hold on
histogram(bootstat_light,'Normalization','Probability','BinWidth', 0.03)
histogram(bootstat_light_calp,'Normalization','Probability','BinWidth', 0.03)
legend('Dark','Light','Light + CaM Antagonist')
xlabel('alpha')
ylabel('Probability Density')
