function show_raw_trace(S)
% Display a raw calcium trace of a specific cell inputted graphically

% Plot correlation between oscillation period and prominence
[mat,~] = struct2mat(S,0);
figure(1)
plot(mat(:,4), mat(:,3),'o')

% Get graphical input
[x_in, y_in] = ginput(1);

while (x_in > 0) && (y_in > 0)
    
    % Search for the closest point to the input coordinate
    k = dsearchn([mat(:,4) mat(:,3)], [x_in, y_in]);
    
    % Plot calcium trace of identified cell
    figure(2)
    plot(S(k).Time, S(k).Intensity)
    
    % Get graphical input
    figure(1)
    [x_in, y_in] = ginput(1);
end



