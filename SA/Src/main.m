function [hf1, hf2]=main()
    hf1=@filenameChangeNotify;
    hf2=@computeDataForStartPos;
    
    function [ ] = filenameChangeNotify ( filename ) 
        global Number;
        global TimeStamp;
        global AccVoltage;
        global Crankshaft;
        global Additionalgeneratorpower;
        global Consumptionpower;
        global Gridvoltage;
        global Fuel;
        global Accvoltage;
        
        [Number,TimeStamp,AccVoltage,Crankshaft,Additionalgeneratorpower,Consumptionpower,Gridvoltage,Fuel,Accvoltage] = importData(filename);
    end

    function [ R1, R2, R3, Y1, Y2, Y3 ] = computeDataForStartPos( startPos )
        global Number;
        global TimeStamp;
        global AccVoltage;
        global Crankshaft;
        global Additionalgeneratorpower;
        global Consumptionpower;
        global Gridvoltage;
        global Fuel;
        global Accvoltage;
        
        N02 = 40;
        N03 = 10;

        % Predict X
        XaccVoltageKnown = AccVoltage(startPos:startPos + N02 - 1);
        XcrankshaftKnown = Crankshaft(startPos:startPos + N02 - 1);
        XadditionalGeneratorPowerKnown = Additionalgeneratorpower(startPos:startPos + N02 - 1);
        XconsumptionPowerKnown = Consumptionpower(startPos:startPos + N02 - 1);

        % XaccVoltagePredict = ArimaP(XaccVoltageKnown, N03);
        % XcrankshaftPredict = ArimaP(XcrankshaftKnown, N03);
        % XadditionalGeneratorPowerPredict = ArimaP(XadditionalGeneratorPowerKnown, N03);
        % XconsumptionPowerPredict = ArimaP(XconsumptionPowerKnown, N03);
        
        XaccVoltagePredict = AccVoltage(startPos + N02:startPos + N02 + N03 - 1);
        XcrankshaftPredict = Crankshaft(startPos + N02 - 1:startPos + N02 + N03 - 1);
        XadditionalGeneratorPowerPredict = Additionalgeneratorpower(startPos + N02:startPos + N02 + N03 - 1);
        XconsumptionPowerPredict = Consumptionpower(startPos + N02:startPos + N02 + N03 - 1);

        % Compute FZ
        YgridVoltageKnown = Gridvoltage(startPos:startPos + N02 - 1);
        YfuelKnown = Fuel(startPos:startPos + N02 - 1);
        YaccVoltageKnown = Accvoltage(startPos:startPos + N02 - 1);

        % Predict Y
        YgridVoltagePredict = Gridvoltage(startPos+N02:startPos + N02 + N03 - 1);
        YfuelPredict = Fuel(startPos+N02:startPos + N02 + N03 - 1);
        YaccVoltagePredict = Accvoltage(startPos+N02:startPos + N02 + N03 - 1);

        % Compute risk
        R1 = 1.0; R2 = 1.0; R3 = 1.0;

        %Compute risk resource

        Y1 = vertcat(YgridVoltageKnown, YgridVoltagePredict);
        Y2 = vertcat(YfuelKnown, YfuelPredict);
        Y3 = vertcat(YaccVoltageKnown, YaccVoltagePredict);
        
        % Y1 = YgridVoltageKnown;
        % Y2 = YfuelKnown;
        % Y3 = YaccVoltageKnown;
    end
end

