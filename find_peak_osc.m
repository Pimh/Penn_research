function S = find_peak_osc(cell_struct,t, thrs)
% Perform feature extraction, extract oscillation characteristics

phase1 = 1:80;
S = cell_struct;

for i = 1:numel(S)
    
    signal_full = cell_struct(i).Intensity-min(cell_struct(i).Intensity);
    signal_phase1 = detrend(signal_full(phase1));
    [pks1,locs1,widths1,proms1] = findpeaks(signal_phase1,t(phase1),...
        'MinPeakDistance',14);
    
    prom_peak_idx = (proms1 >= thrs);
    S(i).n_prom_peaks = sum(prom_peak_idx);
    
    if S(i).n_prom_peaks >=1 
        S(i).peaks = pks1(prom_peak_idx);
        S(i).locations = locs1(prom_peak_idx);
        S(i).widths = widths1(prom_peak_idx);
        S(i).prominences = proms1(prom_peak_idx);
    else
        S(i).peaks = 0;
        S(i).locations = 0;
        S(i).widths = 0;
        S(i).prominences = 0;
    end
       
    
    figure(1)
    plot(t(phase1),signal_phase1)
    title(i)
    hold on
    
    if S(i).n_prom_peaks >=1
        plot(S(i).locations,S(i).peaks,'o')
    end
    plot([t(20) t(20)], [0 max(S(i).peaks)],':k')
    hold off
    
    S(i).osc_width = cal_osc_width(S(i));
    
    if S(i).n_prom_peaks > 2
        loc = locs1(prom_peak_idx);
        Tintv = loc(2:end)-loc(1:(end-1)); 
        S(i).Tav = mean(Tintv);
        S(i).SD_tintv = std(Tintv);
    
        figure(2)
        hold on
        plot(S(i).Tav,S(i).SD_tintv,'*r')
        offset = 0.5;
        text(S(i).Tav + offset,S(i).SD_tintv + offset, int2str(i))
        xlabel('Tav (s)')
        ylabel('SD_intv (s)')
        hold off
    else 
        S(i).Tav = nan;
        S(i).SD_tintv = nan;
    end
    pause()
end