function [ res ] = PHIhrdsin(indic2, a, lambda, x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   a - vector of length j
%   lambda - vector of length ki*j
%   x - vector of length j
res = 0;
tmp = size(lambda, 1)/size(a, 1);
for i=1:1:size(a, 1)
    res = res + a(i)*PSIhrdsin(indic2, lambda([(1+(i-1)*tmp):(i*tmp)]), x(i));
end
end

