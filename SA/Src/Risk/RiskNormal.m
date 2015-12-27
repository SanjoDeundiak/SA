function [ riskNormalN, riskNormalA ] = RiskNormal( x, xN, xA )
    
    pd = fitdist(x(:,1), 'Normal');
    m = pd.mu; s = pd.sigma;

    riskNormalN = 0.5 - erf((m - xN)/s)/2;
    riskNormalA = 0.5 - erf((m - xA)/s)/2;
end

