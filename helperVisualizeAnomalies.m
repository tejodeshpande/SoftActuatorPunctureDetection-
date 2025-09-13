function helperVisualizeAnomalies(anomalies, errorAll, featureTest)
% HELPERVISUALIZEANOMALIES creates a plot of the detected anomalies
anomalyIdx = find(anomalies);
anomalyErr = errorAll(anomalies);

predAE = categorical(anomalies, [1, 0], ["Fail", "Working"]);
trueAE = renamecats(featureTest.label,["Fail","Working"],["Fail","Working"]);

acc = numel(find(trueAE == predAE))/numel(predAE)*100;
figure;
t = tiledlayout("flow");
title(t, "Test Accuracy: " + round(mean(acc),2) + "%");
nexttile
hold on
plot(errorAll)
plot(anomalyIdx, anomalyErr, 'x')
hold off
ylabel("Reconstruction Error")
xlabel("Observation")
legend("Error", "Candidate Anomaly")

nexttile
confusionchart(trueAE,predAE)

end