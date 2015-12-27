function riskLinearA = RiskLinear( x, xN, xA )
    
     p = (xN - x)/(xN-xA);
     if (x > xN)
         p = 0;
     end
     p=min(1,p);
     p=max(0,p);
     riskLinearA = p;
end