clear all;
load('Data1.txt');

% A = Data(:,:);
% A
X_Temp = DataOwn(:, 1:12); 
y = DataOwn(:, 13);
y = NormalizeData(y);
%  X = NormalizeData(X_Temp);
%  X = PolyFeatures(X, 5);
X = PolyFeatures(X_Temp, 8);
X = NormalizeData(X);
X = [ ones(size(X,1),1) X];
 lambda = 0.000;%1905;
 theta = zeros(size(X,2),1);
 %[theta, J_history] = GradientMeth(X, y(:,1), theta, lambda, 1, 1000);
 ind = RandomCV(111);
 Xtrain = X(:,:);
 ytrain = y(:,1);
 IL = eye(size(Xtrain,2));
 %IL(1,1) = 0;
 %theta = pcg(Xtrain'*Xtrain+lambda*IL, Xtrain'*ytrain, 10e-10,10000);
 theta = Conj_Grad(Xtrain'*Xtrain+lambda*IL, Xtrain'*ytrain, theta);
%theta = Conj_Grad(1/45*Xtrain'*Xtrain+lambda/45*IL, 1/45*Xtrain'*ytrain, theta);
%theta = (Xtrain'*Xtrain+lambda*IL)\Xtrain'*ytrain;
%[theta, J_history] = GradientMeth(Xtrain, ytrain, theta, lambda, 1, 10000);
%[theta, J_history] = trainLinearReg(Xtrain, ytrain, lambda);

 Y = X*theta;
 resid = max(abs(Y - y(:,1)));
 
 
 x=1:size(y,1);
  t = x';
 t(:,end+1) = x';
 
 figure;
  
 
% plot(J_history);
 hold on;
 %Y = X*theta;
 Y(:, end+1) = y(:,1);
 plot(t, Y,'LineWidth', 2);
 grid on;
 legend('Model','Original');
 
 






