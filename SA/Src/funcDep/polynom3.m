function [ res ] = polynom3( pol_type, n, x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   1 - Un(x) - Чебышев 2-го рода
%   2 - Cn*(x) - ...
%   3 - Sn*(x) - ...

switch pol_type
    case 5
        res = Un(n, x);
    case 6
        res = Cn(n, x);   
    case 1 
        res = chebyshevT(n,x);
    case 2 
        res = hermite(n, x);
    case 3 
        res = laguerre(n, x);
    case 4 
        res = legendre(n, x);    
    otherwise
        res = Sn(n, x);        
end
if res == -1
    res = -0.999;
end
end

