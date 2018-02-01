function osc_width = cal_osc_width2(S)
% calculate oscillation width

osc_width = [];
for i = 1:numel(S)
    if numel(S(i).widths) >= 2
        big_width = S(i).locations(end) - S(i).locations(1);
    elseif numel(S(i).widths) == 1
        big_width = S(i).widths;
    else
        big_width = [];
    end
    osc_width = [osc_width, big_width];
end
histogram(osc_width, 'Normalization', 'Probability','NumBins',15)