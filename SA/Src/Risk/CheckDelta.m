function [ bVoltage, bFuel ] = CheckDelta( startPos )
    global AccVoltage;
    global Fuel;
    global Gridvoltage;
    
    if (startPos == 1)
        bVoltage = true;
        bFuel = true;
        return;
    end
    
    bVoltage = sign((Gridvoltage(startPos) - Gridvoltage(startPos - 1)) * (AccVoltage(startPos) - AccVoltage(startPos - 1)));
    bFuel = -sign(Fuel(startPos) - Fuel(startPos - 1));
end

