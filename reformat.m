function [ X,y ] = reformat( table )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
       try
        y = table.labels;
        X(:,1) = table.Features_1;
        X(:,2) = table.Features_2;
        X(:,3) = table.Features_3;
        X(:,4) = table.Features_4;
        X(:,5) = table.Features_5;
        X(:,6) = table.Features_6;
        X(:,7) = table.Features_7;
        X(:,8) = table.Features_8;
        X(:,9) = table.Features_9;
        X(:,10) = table.Features_10;
       catch
            X = table.Features;
            y = table.labels;
        end
        
 
end

