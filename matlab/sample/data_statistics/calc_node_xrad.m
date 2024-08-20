function [nodeXrad] = calc_node_xrad(snapshotData)
%CALC_NODE_XRAD Calculates the Xrad value for node data.
%   CALC_NODE_XRAD(SNAPSHOTDATA) calculates the Xrad value for
%   the provided node data matrix or array (SNAPSHOTDATA). The Xrad value
%   is a percentage that quantifies the relative difference between the 
%   average, maximum, and minimum values of the node data.
%
%   Input:
%   SNAPSHOTDATA - A numeric matrix or array containing node data.
%
%   Output:
%   NODExrad - A vector containing the Xrad values for each row of the 
%   input matrix.
%
%   This function:
%   1. Calculates the average value of each row in the input matrix.
%   2. Identifies the maximum and minimum values in each row.
%   3. Computes the Xrad value based on the relative difference between
%      the average, maximum, and minimum values.
%
%   The Xrad is calculated as a percentage using the following logic:
%   - If the difference between the average and minimum values is greater
%     than the difference between the maximum and minimum values, the Xrad
%     is calculated as ((average - minimum) / average) * 100.
%   - Otherwise, it is calculated as ((maximum - average) / average) * 100.
%
%   If an error occurs during the computation, the function returns an empty
%   array for NODExrad.
%
%   Example:
%   nodeXrad = calc_node_xrad(snapshotData)
%
%   See also MEAN, MAX, MIN.
%
%   Copyright 2014-2024 Kitronyx.Inc

    try
        
        % average of all nodes
        nodeAvg = mean(snapshotData,2,"double");
        % max value of all nodes
        nodeMax = max(snapshotData);
        % min value of all nodes
        nodeMin = min(snapshotData);

        % %XRAD of all nodes
        if (nodeAvg - nodeMin) > (nodeMax - nodeMin) 
           nodeXrad = ((nodeAvg - nodeMin) / nodeAvg)*100;
        else
           nodeXrad = ((nodeMax - nodeAvg) / nodeAvg)*100;
        end

    catch e
        disp(['Error: ', e.message]);
        nodeXrad = [];
    end
end
