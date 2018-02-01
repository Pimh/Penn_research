function [S, Tav_ratio, amp_ratio] = cal_ratio(S)

% Define phase1 and phase2 timepoints
phase1 = 1:19;
phase2 = 20:50;

% Initialize parameters
Tav_ratio = [];
prom_ratio = [];
amp_ratio = [];

for i = 1:numel(S)
    
    % Calculate osc. frequency of phase1 and phase2
    peak_loc_1 = S(i).locations(S(i).locations <= S(i).Time(phase1(end)));
    Tav_1 = mean(peak_loc_1(2:end) - peak_loc_1(1:end-1));
    
    peak_loc_2 = S(i).locations((S(i).locations >= S(i).Time(phase2(1))) &...
        (S(i).locations <= S(i).Time(phase2(end))));
    Tav_2 = mean(peak_loc_2(2:end) - peak_loc_2(1:end-1));
    
    % Calculate ratio of period between phase 1 and phase 2
    Tav1to2 = Tav_1/Tav_2;
    Tav_ratio = [Tav_ratio; Tav1to2];
    
    S(i).Tav_1 = Tav_1;
    S(i).Tav_2 = Tav_2;
    
    % Calculate peak prominence of phase1 and phase2
    peak_prom_1 = S(i).prominences(S(i).locations <= S(i).Time(phase1(end)));
    prom_1 = mean(peak_prom_1);
    
    peak_prom_2 = S(i).prominences((S(i).locations >= S(i).Time(phase2(1))) &...
        (S(i).locations <= S(i).Time(phase2(end))));
    prom_2 = mean(peak_prom_2);
    
    % Calculate ratio of prominences between phase 1 and phase 2
    prom1to2 = prom_2/prom_1;
    prom_ratio = [prom_ratio; prom1to2];
    
    S(i).prom_1 = prom_1;
    S(i).prom_2 = prom_2;
    
    
    % Calculate peak amplitude of phase1 and phase2
    peak_amp_1 = S(i).peaks(S(i).locations <= S(i).Time(phase1(end)));
    amp_1 = mean(peak_amp_1);
    
    peak_amp_2 = S(i).peaks((S(i).locations >= S(i).Time(phase2(1))) &...
        (S(i).locations <= S(i).Time(phase2(end))));
    amp_2 = mean(peak_amp_2);
    
    
    S(i).amplitude_1 = amp_1;
%     if isnan(amp_2)
%         amp_2 = 0;
%     end
    S(i).amplitude_2 = amp_2;
    ratio = S(i).amplitude_2/S(i).amplitude_1;
    amp_ratio = [amp_ratio; ratio];
    
end