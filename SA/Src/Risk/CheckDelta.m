function [ bVoltage, bFuel ] = CheckDelta( startPos )
    global AccVoltage;
    global Gridvoltage;
    global Fuel;
    N03=249;
    
    if (startPos < N03+1)
        bVoltage = true;
        bFuel = true;
        return;
    end
    
    arr = [startPos - N03: startPos]';
    data1 = iddata(Gridvoltage(startPos - N03: startPos), arr); 
    data2 = iddata(AccVoltage(startPos - N03: startPos), arr);
    T1 = getTrend(data1, 1);
    T2 = getTrend(data2, 1);
    
    % [pp s] = polyfit(Gridvoltage(startPos - 99: startPos));
    
    function [ res ] = signum(x, eps)
        if (abs(x) < eps)
            res = 0;
            return;
        end;
        
        res = sign(x);
    end

    TrendSgn1 = 1200*T1.OutputSlope;
    TrendSgn2 = 1200*T2.OutputSlope;
    
    bVoltage = -1.0;
    if (signum(TrendSgn1, 1) == signum(TrendSgn2, 1) )
        bVoltage = 1.0;
    
    else
        if (signum(TrendSgn1, 1) == 0 && signum(TrendSgn2, 1) == 1)
            bVoltage = 1.0;
        end
    
    end
    
    
    bFuel = -sign(Fuel(startPos) - Fuel(startPos - 1));
    if (bFuel == 0)
        bFuel = 1;
    end
end

