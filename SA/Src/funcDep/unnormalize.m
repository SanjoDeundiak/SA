function [ res ] = unnormalize(X,maxX, minX)
%UNNORMALIZE Summary of this function goes here
%   Detailed explanation goes here
    res = zeros(size(X,1),1);
    for i = 1:size(X)
        res(i) = X(i)*(maxX - minX)+minX;
    end

end

