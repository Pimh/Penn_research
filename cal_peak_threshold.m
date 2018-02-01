function out2 = cal_peak_threshold(S,t)
% Compute a threshold at which a peak is considered prominent using Otsu's
% thresholding method

for i = 1:numel(S)
    out1 = find_peak_osc(S(i),t,1);

    h = histogram(out1.prominences,10);
    [T, ~] = otsuthresh(h.Values);
    thrs = (h.BinLimits(2)-h.BinLimits(1))*T + h.BinLimits(1);
    thrs = max(thrs, 30);
    
    out2(i) = find_peak_osc(S(i),t,thrs);
    %pause();
end