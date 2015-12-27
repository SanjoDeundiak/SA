function [ res ] = normalize(X,maxX, minX)
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here
    res = zeros(size(X,1),1);
    for i = 1:size(X)
        res(i) = (X(i) - minX)/(maxX - minX);
    end
end

