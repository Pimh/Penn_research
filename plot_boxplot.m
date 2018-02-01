function plot_boxplot(S)
% Plot boxplot for comparison of oscillation between pre- vs.
% post-illumination

Tav1 = []; Tav2 = [];
amp1 = []; amp2 = [];
for i = 1:numel(S)
    Tav1 = [Tav1; S(i).Tav_1];
    Tav2 = [Tav2; S(i).Tav_2];
    amp1 = [amp1; S(i).amplitude_1];
    amp2 = [amp2; S(i).amplitude_2];
end

figure()
boxplot([Tav1, Tav2])
ax = gca;
ax.XTickLabel = {'Pre-Illum.', 'Post-Illum.'};
ylabel('Oscillation period (s)')

figure()
boxplot([amp1, amp2])
ax = gca;
ax.XTickLabel = {'Pre-Illum.', 'Post-Illum.'};
ylabel('Amplitude (AU)')