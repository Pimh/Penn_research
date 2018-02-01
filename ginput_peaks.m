function S_out = ginput_peaks(S)
% Manually select prominent peaks

j = 0;
for i = 1:numel(S)
        if S(i).n_prom_peaks > 0
            X = [S(i).locations S(i).peaks];
        
            figure(1)
            plot(S(i).Time, S(i).Intensity-S(i).Intensity(1))
            hold on
            plot(S(i).locations, S(i).peaks,'o')
            hold off

            XI = ginput;
            if ~isempty(XI)
                j = j+1;
                k = dsearchn(X,XI);
                S(i).locatioins_ginput = S(i).locations(k);
                S(i).peaks_ginput = S(i).peaks(k);
                S_out(j) = S(i);
            end   
        end

end

