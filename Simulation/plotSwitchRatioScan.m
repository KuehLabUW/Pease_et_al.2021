clear
AlphaOFF = 8;
alphas = ["0.2","0.4","0.8","1.6","3.2","6.4"];
alphasN = [0.2,0.4,0.8,1.6,3.2,6.4];
AlphaRatio = alphasN./(AlphaOFF);
MeanFMethyl = (100./(1+AlphaOFF./alphasN))./100;
SwitchRate = [];
for i = 1:numel(alphas)
    GoodM = [];
    filename = 'TrunF0.9LifeTimePhaseAlphaON%sAlphaOFF8LambdaON102DeltaOFF5300Cycle20.csv';
    filename = sprintf(filename,alphas(i));
    disp(filename)
    M = csvread(filename);
    for j = 1:numel(M)
        if M(j)< 19999.9
            GoodM = [GoodM M(j)];
        end
    end
    %histogram(GoodM)
    GoodM = 1/mean(GoodM);
    SwitchRate = [SwitchRate GoodM];
end
figure(1)
hold on
scatter(log10(AlphaRatio),log10(SwitchRate))
plot(log10(AlphaRatio),log10(SwitchRate))
ylabel('log10(switch rate)')
xlabel('log10(alphaON/alphaOFF)')

figure(2)
hold on
scatter(log10(MeanFMethyl),log10(SwitchRate))
plot(log10(MeanFMethyl),log10(SwitchRate))
ylabel('log10(switch rate)')
xlabel('log10(average methylation state)')


