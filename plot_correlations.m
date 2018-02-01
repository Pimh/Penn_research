function corr = plot_correlations(S, thrs, colr)
% Plot correlation analysis for data with expression level

corr = [];
[mat_exp,~] = struct2mat(S, thrs);

ax = subplot(2,3,1);
plot(mat_exp(:,7), mat_exp(:,1), colr)
[r,p,rl,ru] = corrcoef(mat_exp(:,1), mat_exp(:,7));
corr = [corr; [r(1,2),p(1,2),rl(1,2),ru(1,2)]];
%ax.XLim = [0 6000];
text(mean(ax.XLim), mean(ax.YLim), ['corr: ' num2str(r(1,2))])

ax = subplot(2,3,2);
plot(mat_exp(:,7), mat_exp(:,2), colr)
[r,p,rl,ru] = corrcoef(mat_exp(:,2), mat_exp(:,7));
corr = [corr; [r(1,2),p(1,2),rl(1,2),ru(1,2)]];
%ax.YLim = [0 100]; ax.XLim = [0 6000];
text(mean(ax.XLim), mean(ax.YLim), ['corr: ' num2str(r(1,2))])

ax = subplot(2,3,3);
plot(mat_exp(:,7), mat_exp(:,3), colr)
[r,p,rl,ru] = corrcoef(mat_exp(:,3), mat_exp(:,7));
corr = [corr; [r(1,2),p(1,2),rl(1,2),ru(1,2)]];
%ax.YLim = [0 100]; ax.XLim = [0 6000];
text(mean(ax.XLim), mean(ax.YLim), ['corr: ' num2str(r(1,2))])


ax = subplot(2,3,4);
plot(mat_exp(:,7), mat_exp(:,4), colr)
[r,p,rl,ru] = corrcoef(mat_exp(:,4), mat_exp(:,7));
corr = [corr; [r(1,2),p(1,2),rl(1,2),ru(1,2)]];
%ax.XLim = [0 6000];
text(mean(ax.XLim), mean(ax.YLim), ['corr: ' num2str(r(1,2))])

ax = subplot(2,3,5);
plot(mat_exp(:,7), mat_exp(:,6), colr)
[r,p,rl,ru] = corrcoef(mat_exp(:,6), mat_exp(:,7));
corr = [corr; [r(1,2),p(1,2),rl(1,2),ru(1,2)]];
%ax.XLim = [0 6000];
text(mean(ax.XLim), mean(ax.YLim), ['corr: ' num2str(r(1,2))])

ax = subplot(2,3,1);
xlabel('mCherry expression (RLU)');
ylabel('# of peaks');
hold on
ax = subplot(2,3,2);
xlabel('mCherry expression (RLU)');
ylabel('Peak amplitude');
hold on
ax = subplot(2,3,3);
xlabel('mCherry expression (RLU)');
ylabel('Peak prominence');
hold on
ax = subplot(2,3,4);
xlabel('mCherry expression (RLU)');
ylabel('Osc. period(s)');
hold on
ax = subplot(2,3,5);
xlabel('mCherry expression (RLU)');
ylabel('Osc. width(s)');
hold on