function yp = cal_prctile(mat,prct)
% Calculate dFoF prct-th percentile of each expression bin

exp = mat(:,7);
prom = mat(:,3);
xe = 0.8:.02:1.12;
yp = [];
for i = 1:length(xe)-1
    tf = (exp >= xe(i)) & (exp < xe(i+1));
    yp(i) = prctile(prom(tf), prct);
    
end