function [] = Test()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    data = importdata('inputData.csv');
    x = data.data(750:850, 7);
    
    [r1 r2] = RiskNormal(x, 11.7, 10.5)
end

