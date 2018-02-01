function S = append_struct(S1,S2)

n = numel(S1);
m = numel(S2);

S(1:n) = S1;
S(n+1:n+m) = S2;