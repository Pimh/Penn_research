function d = cohens_d(X,Y)
% compute Cohen's d value, a measure of effect size

X = X(~isnan(X));
Y = Y(~isnan(Y));
Mx = nanmean(X);
My = nanmean(Y);
nx = length(X);
ny = length(Y);

sx = 1/(nx-1) * sum((X - Mx).^2);
sy = 1/(ny-1) * sum((Y - My).^2);
SD_pool = sqrt(((nx-1)*sx + (ny-1)*sy)/(nx+ny-2));
d = (Mx - My)/SD_pool;