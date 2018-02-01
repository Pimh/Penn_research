function mdl_slope = cal_alpha_bootstrap(S)
% Plot Tav vs SD of Ca2+ signals phase2 and compare between light vs. dark
% Written 2017.11.13

% Define phase1 and phase2 timepoints
phase1 = 1:19;
phase2 = 20:length(S(1).Time);
npeak_cutoff = 4;

% Initialize parameters
param = [];
color = {[0 0.447 0.741],[0.635 0.0784 0.184],[0.3020 0.6863 0.2902]};
colr = 1;
for i = 1:numel(S)
     
    peak_loc_2 = S(i).locations((S(i).locations >= S(i).Time(phase2(1))) &...
        (S(i).locations <= S(i).Time(phase2(end))));
    Tav_2 = mean(peak_loc_2(2:end) - peak_loc_2(1:end-1));
    sd_2 = std(peak_loc_2(2:end) - peak_loc_2(1:end-1));
    
    npeak = length(peak_loc_2);
    if (npeak >= npeak_cutoff)
        param = [param; Tav_2 sd_2 npeak];
    end
end

% Calculate alpha
mdl = LinearModel.fit(param(:,1), param(:,2), 'RobustOpts','off');
mdl_slope = mdl.Coefficients.Estimate(2);


