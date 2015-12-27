function riskStaticA = RiskStatic( x, xN, xA )
    
     p = 0.5*arccoth(x/xA)/arccoth(xN/xA);
     riskStaticA = p;
end
