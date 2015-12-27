function [ res ] = PSIhrdsin(indic2, lambda, x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   lambda - vector L (p elements)
%   x - value of x
res = 0;
for i=1:1:size(lambda, 1)
    res = res + lambda(i)*asinh(polynom3(indic2,i-1,x));
end
end

