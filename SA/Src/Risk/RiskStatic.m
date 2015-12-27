function riskStaticA = RiskStatic( x, xOK, xA )
    
    p = ((xOK - x)/(xOK-xA))^2.5;
    if (x >= xOK)
        p = 0;
    end
    
    p = min(1, p);
    
    riskStaticA = p;
end
