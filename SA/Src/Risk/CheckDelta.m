function [ bVoltage, bFuel ] = CheckDelta( startPos )
    global AccVoltage;
    global Fuel;
    
    if (startPos == 1)
        bVoltage = true;
        bFuel = true;
        return;
    end
    
    bVoltage = sign((GridVoltage(startPos) - GridVoltage(startPos - 1)) * (AccVoltage(startPos) - AccVoltage(startPos - 1)));
    bFuel = -sign(Fuel(startPos) - Fuel(startPos - 1));
end

