function cell = excel2struct_csv(fname,tvec,varargin)

% Default cutoff for ROIs considered as cells
area_cutoff = 1000;
low_bound = 0;        % lower intensity boundary
high_bound = 15000;     % higher intensity boundary

% Check additional input arguments
n_arg = numel(varargin);

for i = 1:2:n_arg  
    % Reset area cutoff if given in the input arguments
    if strcmp(varargin{i},'Area')
        area_cutoff = varargin{i+1};
        
    % Reset intensity boundaries if given in the input arguments
    elseif strcmp(varargin{i}, 'Intensity')
        low_bound = varargin{i+1}(1);
        high_bound = varargin{i+1}(2);
    else
        disp('Incorrect input argument')
    end    
end 

% Read in intensity measurements from the excel file
data = csvread(fname, 1, 2);
nt = numel(tvec);
[m,~] = size(data);
ncell = floor(m/nt);
j = 1;

for i= 1:ncell
    
    % Get row index of cell i
    cur_row = (rem(1:m,ncell)==i);   
    if i == ncell
        cur_row = (rem(1:m,ncell)==0);
    end
    
    % Assign area and intensity values
    area = data(cur_row, 1);
    intensity = data(cur_row, 2);
    is_in_intbound = intensity >= low_bound & intensity <= high_bound;
    
    % If the ROI area and intensity pass the cutoff threshold, store them
    % in a cell struct
    if (area > area_cutoff) & (is_in_intbound)
        
        % Create a cell struct
        cell(j)= struct('Time',tvec,'cellID',data(cur_row,1),'Area',data(cur_row,1),...
            'Intensity',data(cur_row,2), 'Norm_intensity',[]);
        
        % Calculate normalized intensity
        delta_int = (cell(j).Intensity-cell(j).Intensity(1))/cell(j).Intensity(1);
        cell(j).Norm_intensity = delta_int;
        
        j = j+1;
    end
        
end




