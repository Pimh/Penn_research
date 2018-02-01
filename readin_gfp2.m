function S = readin_gfp2(fname,S)
% read a spreadsheet with time-series expression

data = xlsread(fname);
id = data(:,1);
gfp_int = data(:,4);

for i = 1:numel(S)
    idx = (S(i).cellID(1) == id);
    S(i).gfp_expression(1) = gfp_int(idx);
    
    idx = (S(i).cellID(2) == id);
    S(i).gfp_expression(2) = gfp_int(idx);
end
