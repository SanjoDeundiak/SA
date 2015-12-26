function [] = Test()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    data = importdata('inputData.csv');

   % model=arima(data.data(:,6),4);
   Mdl = arima('Constant',0,'D',1,'Seasonality',12,...
    'MALags',1,'SMALags',12); 
   y=data.data(:,4);
%past_data = z1(1:40);
%future_inputs = z1(41:end);
%model = polyest(z1, [2 2 2 0 0 1],'IntegrateNoise',true);
EstMdl = estimate(Mdl,y);
K=10;
%yf=forecast(model,past_data,K);
[yF,yMSE] = forecast(EstMdl,K,'Y0',y);
%a(:,1)=yf;
%a(:,2)=z1(41:50); 
  yF  

end

