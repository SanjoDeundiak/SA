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

    function [ R, Y1, Y2, Y3 ] = computeDataForStartPos( startPos )
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

        YAccVoltageN = 11.7;
        YAccVoltageA = 10.5;
       
        YGridVoltageN = 11.7;
        YGridVoltageA = 10.5;
        
        YFuelN = 10.0;
        YFuelA = 5.0;
        % Compute risk        
        [riskAccVoltageN, riskAccVoltageA ] = RiskNormal( YaccVoltagePredict, YAccVoltageN, YAccVoltageA );
        [riskGridVoltageN, riskGridVoltageA ] = RiskNormal( YgridVoltagePredict, YGridVoltageN, YGridVoltageA );
        [riskFuelN, riskFuelA ] = RiskNormal( YfuelPredict, YFuelN, YFuelA );

        
        R1N = min(1, 1 - (1 - 2 * riskAccVoltageN) * (1 - 2 * riskGridVoltageN) * (1 - 2 * riskFuelN));
        R1A = min(1, 1 - (1 - 2 * riskAccVoltageA) * (1 - 2 * riskGridVoltageA) * (1 - 2 * riskFuelA));
        
        R2AK = 1-(1-RiskLinear( YaccVoltageKnown(size(YaccVoltageKnown,1)), YAccVoltageN, YAccVoltageA))...
            *(1-RiskLinear( YgridVoltageKnown(size(YgridVoltageKnown, 1)), YGridVoltageN,  YGridVoltageA ))...
            *(1-RiskLinear( YfuelKnown(size(YfuelKnown,1)), YFuelN, YFuelA ));
        R2AP = 1-(1-RiskLinear( YaccVoltagePredict(size(YaccVoltagePredict,1)), YAccVoltageN, YAccVoltageA))...
            *(1-RiskLinear( YgridVoltagePredict(size(YgridVoltagePredict, 1)), YGridVoltageN,  YGridVoltageA ))...
            *(1-RiskLinear( YfuelPredict(size(YfuelPredict,1)), YFuelN, YFuelA ));
        
        R3N = 1.0;
        R3A = 1.0;
        
        R = [R1N, R1A, R2AK, R2AP, R3N, R3A];

        %Compute risk resource

        Y1 = vertcat(YgridVoltageKnown, YgridVoltagePredict);
        Y2 = vertcat(YfuelKnown, YfuelPredict);
        Y3 = vertcat(YaccVoltageKnown, YaccVoltagePredict);
        
        % Y1 = YgridVoltageKnown;
        % Y2 = YfuelKnown;
        % Y3 = YaccVoltageKnown;
    end
end

