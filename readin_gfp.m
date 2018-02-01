function S = readin_gfp(fname,S)
% read a spreadsheet with a single timepoint expression

data = xlsread(fname);
id = data(:,1);
gfp_int = data(:,4);

for i = 1:numel(S)
    idx = (S(i).cellID(1) == id);
    S(i).gfp_expression = gfp_int(idx);
end
