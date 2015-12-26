clear all;
load('data1.txt');
time = 881;
window = 50;
firstInd = time - window+1;

% A = Data(:,:);
% A
% X_learn3 = data1(:, 2:4);
% X_learn3 = NormalizeData(X_learn3); 
% X_learn3 = X_learn3(firstInd:time, :);
X_Temp = [data1(:, 1:2) data1(:, 4)]; 
y = data1(:, 5:7);
y = NormalizeData(y);

X_Temp = NormalizeData(X_Temp); 
X_learn = X_Temp(firstInd:time, :);
X_test = X_Temp(firstInd:time+10, :);
Y_learn = y(firstInd:time,1);
X_learn2 = X_Temp(firstInd:time, 2);
Y_learn2 = y(firstInd:time,2);
X_learn3 = X_Temp(firstInd:time, 2:3);
Y_learn3 = y(firstInd:time,3);

Y_NN = myNeuralNetworkFunctionForY1_881(X_test');
Y_NN2 =  myNeuralNetworkFunctionForY2(X_test(:,2)');
Y_NN3 =  myNeuralNetworkFunctionForY3_881(X_test(:,2:3)');

figure;
hold on;
grid on;
plot(firstInd:time+10, (y(firstInd:time+10,1))','LineWidth', 2);
plot(firstInd:time+10, Y_NN(1,:),'r-','LineWidth', 2);
plot(time*ones(1,2), [0,1], 'g-','LineWidth', 1 );
legend('real', 'with forecast');
%plot(782:821, Y_NN(1,:),'g-','LineWidth', 2)

figure;
hold on;
plot(firstInd:time+10, (y(firstInd:time+10,2))','LineWidth', 2);
plot(firstInd:time+10, Y_NN2(1,:),'r-','LineWidth', 2);
plot(time*ones(1,2), [0,1], 'g-','LineWidth', 1 );
legend('real', 'with forecast');
grid on;

figure;
hold on;
plot(firstInd:time+10, (y(firstInd:time+10,3))','LineWidth', 2);
plot(firstInd:time+10, Y_NN3(1,:),'r-','LineWidth', 2);
plot(time*ones(1,2), [0,1], 'g-','LineWidth', 1 );
legend('real', 'with forecast');
grid on;




