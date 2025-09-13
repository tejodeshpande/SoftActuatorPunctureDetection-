function helperVisualizeModelBehavior(normalData, abnormalData, reconstructedNorm, reconstructedAbNorm)
%HELPERVISUALIZEMODELBEHAVIOR Visualize model behavior on sample validation data

figure("Color", "W")
tiledlayout("flow")

nexttile()
hold on
colororder('default')
yyaxis left
plot(normalData')
plot(reconstructedNorm',":","LineWidth",1.5)
hold off
title("Working (Normal) Input")
grid on
ylabel("Feature Value")
yyaxis right
stem(abs(normalData' - reconstructedNorm'))
ylim([0 2])
ylabel("Error")
legend(["Input", "Reconstructed","Error"],"Location","southwest")

nexttile()
hold on
yyaxis left
plot(abnormalData)
plot(reconstructedAbNorm',":","LineWidth",1.5)
hold off
title("Fail (Abnormal) Input")
grid on
ylabel("Feature Value")
yyaxis right
stem(abs(abnormalData' - reconstructedAbNorm'))
ylim([0 2])
ylabel("Error")
legend(["Input", "Reconstructed","Error"],"Location","southwest")

end