function [ res ] = chebyshevT( n, x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    a = zeros(n+1);
    a(1) = 1;
    %a(2) = x;
    %for i=3:1:(n+1)
    %    a(i) = 2*x*a(i-1) - a(i-2);
    %end
    a(2) = -1 + 2*x;
    for i=3:1:(n+1)
        a(i) = 2*(2*x - 1)*a(i-1) - a(i-2);
    end
    res = a(n+1);


