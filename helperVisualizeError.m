function helperVisualizeError(errorBefore, errorAfter)
% HELPERVISUALIZEERROR creates a plot to visualize the errors on detecting
% before and after conditions
figure("Color", "W")
tiledlayout("flow")

nexttile
plot(1:length(errorBefore), errorBefore, 'LineWidth',1.5), grid on
title(["Puncture (anomalous) Case", ...
   sprintf("Mean Error: %.2f\n", mean(errorBefore))])
xlabel("Observations")
ylabel("Reconstruction Error")
xlim([0 210])

nexttile
plot(1:length(errorAfter), errorAfter, 'LineWidth',1.5), grid on,
title(["Working (non-anomalous) Case", ...
   sprintf("Mean Error: %.2f\n", mean(errorAfter))])
xlabel("Observations")
ylabel("Reconstruction Error")
xlim([0 210])

end
