function X = helperExtractLabeledData(featureTable, label)
%HELPEREXTRACTLABELEDDATA Extract data from before or after operating
%conditions and re-format to support input to deep neural network

% Select data with label After
if label == "All"
   Xtemp = featureTable(:, 2:end).Variables;
else
   tF = featureTable.label == label;
   Xtemp = featureTable(tF, 2:end).Variables;
end

% Arrange data into cells
X = cell(length(Xtemp),1);
for i = 1:length(Xtemp)
   X{i,:} = Xtemp(i,:)';
end

X = horzcat(X{:})';
end