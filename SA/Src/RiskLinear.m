function [ riskLinearA ] = RiskLinear( x, xN, xA )
    
     p = (x -xN)/(xN-xA);
     p=min(1,p);
     p=max(0,p);
     riskLinearA = p;
end