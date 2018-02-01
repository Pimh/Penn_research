function [stat, samp,ci] = cal_bootstrap_stat(S)

ci = bootci(1000,@cal_alpha_bootstrap,S);
[stat,samp] = bootstrp(1000,@cal_alpha_bootstrap,S);