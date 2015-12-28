function [ YgridVoltagePredict,YaccVoltagePredict,YfuelPredict ] = Predict(XaccVoltageKnown,XcrankshaftKnown,XadditionalGeneratorPowerKnown,XconsumtionPowerKnown, YgridVoltageKnown,YaccVoltageKnown,YfuelKnown,N03 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

 time = 500;
 window =N03;
 firstInd = time - window+1;
X_Temp = [XaccVoltageKnown XcrankshaftKnown XconsumtionPowerKnown]; 
%X_Temp = [data1(:, 1:2) data1(:, 4)];
y = [YgridVoltageKnown,YaccVoltageKnown,YfuelKnown];

y = NormalizeData(y);

X_Temp = NormalizeData(X_Temp); 
X_learn = X_Temp(firstInd:time, :);
X_test = X_Temp(firstInd:time+10, :);
Y_learn = y(firstInd:time,1);
X_learn2 = X_Temp(firstInd:time, 2);
Y_learn2 = y(firstInd:time,2);
X_learn3 = X_Temp(firstInd:time, 2:3);
Y_learn3 = y(firstInd:time,3);

YgridVoltagePredict = myNeuralNetworkFunctionForY1_881(X_test');
YaccVoltagePredict =  myNeuralNetworkFunctionForY2(X_test(:,2)');
YfuelPredict =  myNeuralNetworkFunctionForY3_881(X_test(:,2:3)');

end

