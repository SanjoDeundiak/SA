function [ R1, R2, R3, Y1, Y2, Y3 ] = process( startPos )
    N02 = 40;
    N03 = 10;

    % Predict X
    XaccVoltageKnown = data.data(startPos:startPos + N02 - 1, 3);
    XcrankshaftKnown = data.data(startPos:startPos + N02 - 1, 4);
    XadditionalGeneratorPowerKnown = data.data(startPos:startPos + N02 - 1, 5);
    XconsumptionPowerKnown = data.data(startPos:startPos + N02 - 1, 6);

    % Compute FZ
    YgridVoltageKnown = data.data(startPos:startPos + N02 - 1, 7);
    YfuelKnown = data.data(startPos:startPos + N02 - 1, 8);
    YaccVoltageKnown = data.data(startPos:startPos + N02 - 1, 9);

    % Predict Y
    
    
    R1 = 1.0; R2 = 1.0; R3 = 1.0;

    Y1 = data.data(startPos:startPos + N02 + N03 - 1, 7);
    Y2 = data.data(startPos:startPos + N02 + N03 - 1, 8);
    Y3 = data.data(startPos:startPos + N02 + N03 - 1, 9);

function [ ] = filenameChangeNotify ( filename ) 
    data = importData(filename);
end