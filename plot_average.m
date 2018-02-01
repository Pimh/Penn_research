function [S_exp, S_non] = plot_average(S, t, thrs)
% Plot average calcium signal

S_exp = []; S_non = [];

for i = 1:numel(S)
    if S(i).Norm_intensity <= 1.5
        if S(i).gfp_expression >= thrs
            S_exp =  [S_exp, S(i).Norm_intensity];
        else
            S_non = [S_non, S(i).Norm_intensity];
        end
    end
end

figure(1)
plot(t, mean(S_exp,2))
hold on
plot(t, mean(S_non,2))
xlabel('time(s)')
ylabel('\DeltaF/F')
legend('Expressing cells', 'Non-expressing cells')
