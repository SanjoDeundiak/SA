function [ R1, R2, R3, Y1, Y2, Y3 ] = process( startPos )
%MAIN Summary of this function goes here
%   Detailed explanation goes here

    N02 = 40;
    N03 = 10;

    R1 = 1.0; R2 = 1.0; R3 = 1.0;
    
    Y1 = data.data(startPos:startPos + N02 + N03, 7);
    Y2 = data.data(startPos:startPos + N02 + N03, 8);
    Y3 = data.data(startPos:startPos + N02 + N03, 9);
end

function [ ] = filenameChangeNotify ( filename ) 
    data = importData(filename);
end