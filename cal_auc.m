function [Q, prom] = cal_auc(S, t, tend)
% Calculate area under the curve

tcal = 1:tend;

df = S.Intensity-min(S.Intensity(1:6));
plot(t(tcal), df(tcal));
Q = trapz(t(tcal), df(tcal));
prom = sum(S.prominences .* S.widths'/2);

if Q < 0
    Q = 0;
end


