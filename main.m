function S = main(fname_rhod, fname_gfp, tvec, varargin)

addpath('excels')

% Read in intensity data from an excel spreadsheet
cell = excel2struct(fname_rhod,tvec,varargin);

% Characterize the intensity signal
S = find_peak_osc(cell,tvec,5);

% Read in GFP expression intensity
S = readin_gfp(fname_gfp,S);