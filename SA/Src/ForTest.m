function [] = Test()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    data = importdata('inputData.csv');

   % model=arima(data.data(:,6),4);
   Mdl = arima('Constant',1,'D',1,'Seasonality',10,...
    'MALags',3,'SMALags',1); 
   y=data.data(:,6);
%past_data = z1(1:40);
%future_inputs = z1(41:end);
%model = polyest(z1, [2 2 2 0 0 1],'IntegrateNoise',true);
EstMdl = estimate(Mdl,y);
K=10;
%yf=forecast(model,past_data,K);
[yF,yMSE] = forecast(EstMdl,K,'Y0',y);

a(:,1)=yF;
a(:,2)=y(11:20); 
  a 

end

