function [V_prom, V_Q, V_dr, V_Adr] = discriminate_signal(S, t)
% Catagorize type of calcium signals: transient vs. oscillation

V_prom = [];
V_Q = [];
V_dr = []; V_Adr = [];
for i = 1:numel(S)
    
    plot (t, S(i).Intensity-min(S(i).Intensity(1:10)))
    
    % Consider transient signal (TR) if less than 3 peaks
    if S(i).n_prom_peaks <= 2
        
        % Get the maximum peak prominence
        prom = max(S(i).prominences);
        V_prom = [V_prom; prom];
        
        % Get the signal AUC
        [Q, ~] = cal_auc(S(i), t,length(t));
        V_Q = [V_Q; Q];
        
    else % Consider Multiple peak signal if contains at least 3 peaks
        
        % Compute duty ratio
        tend = S(i).locations(end);
        dr = sum(S(i).widths)/tend;
        V_dr = [V_dr; dr];
        
        % Compute area duty ratio
        [auc, ~] = cal_auc(S(i), t,find(t==tend));
        Amax = tend * max(S(i).prominences);
        Adr = auc/Amax;
        V_Adr = [V_Adr; Adr];
    end
    
    pause
    
end