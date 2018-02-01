function [mat_exp, mat_non] = struct2mat(S, thrs, exprn)
% convert struct to 7-column matrix for correlation analysis
% S is the cell construct outputed from main function
% thrs is an expression threshold at which the cell is considered as
% expressing vs. non-expressing
% exprn is type of expression value desired for the output matrices;
% 1 = absolute expression level, 2 = expression ratio or translocation
% efficiency
% return matrices of expressing and non expressing celles with 7 columns
% column 1-7: (1)peak number, (2)amplitude, (3)prominence, (4)period, 
% (5)SD_period, (6)width, (7)expression level or translocation ratio

mat_exp = [];
mat_non = [];

for i = 1:numel(S)
    
    % calculate maximum peak prominence
    [~, idx] = max(S(i).prominences);
    
    % calculate expression level or translocation efficiency
    if exprn == 1
        expression = S(i).gfp_expression;
    elseif exprn == 2
        expression = S(i).gfp_expression(2)/S(i).gfp_expression(1);  
    end 
    
    % construct metrices
    if expression >= thrs
     mat_exp = [mat_exp; [S(i).n_prom_peaks, S(i).peaks(idx), S(i).prominences(idx),...
        S(i).Tav, S(i).SD_tintv, S(i).osc_width,...
        expression]];
    else
     mat_non = [mat_non; [S(i).n_prom_peaks, S(i).peaks(idx), S(i).prominences(idx),...
        S(i).Tav, S(i).SD_tintv, S(i).osc_width,... 
        expression]];
    end
    
end

