function [ time ] = Resource( X )
%RESOURCE Summary of this function goes here
%   Detailed explanation goes here
    
    x = 1 : size(X, 2);
    p = polyfit(x, X, 5);
    p(size(X,2)) = -1;
    r = roots(p);
    
    if (isempty(r))
        time = Inf;
        time
        return;
    end
    
    minPosReal = Inf;
    for i=1:1:size(r, 1)
        if (imag(r(i)) == 0.0 && real(r(i)) >= 0.0 && real(r(i)) < minPosReal)
            minPosReal = real(r(i));
        end
    end
    
    minPosReal
    time = minPosReal;
end

