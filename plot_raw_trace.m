function plot_raw_trace(S, i)
% Plot a raw trace of calcium signal

% Define illumination location
t_light_start = 19;
t_light_end = 20;

% Plot calcium trace and location at which cells were being illuminated
delta_intensity = S(i).Intensity - min(S(i).Intensity);
plot(S(i).Time, delta_intensity, 'LineWidth',1)
hold on
plot([S(i).Time(t_light_start) S(i).Time(t_light_start)], [min(delta_intensity),max(delta_intensity)],':k')
plot([S(i).Time(t_light_end) S(i).Time(t_light_end)], [min(delta_intensity),max(delta_intensity)],':k')

% Label axes
xlabel('time (s)', 'FontSize', 11)
ylabel('Fluorescence (AU)', 'FontSize', 11)
