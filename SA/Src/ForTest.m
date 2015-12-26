function [] = Test()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    data = importdata('inputData.csv');
    [D PD] = allfitdist(data.data(:,6), 'PDF');
end

