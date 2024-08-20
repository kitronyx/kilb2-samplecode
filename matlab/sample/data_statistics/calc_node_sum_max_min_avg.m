function [nodeSum, nodeMax, nodeMin, nodeAvg] = calc_node_sum_max_min_avg(snapshotData)
%CALC_NODE_SUM_MAX_MIN_AVG Calculates the sum, max, min, and average of node data.
%   [NODESUM, NODEMAX, NODEMIN, NODEAVG] = CALC_NODE_SUM_MAX_MIN_AVG(SNAPSHOTDATA)
%   takes a matrix or array (SNAPSHOTDATA) as input and computes the sum,
%   maximum, minimum, and average values across all nodes (rows).
%
%   Input:
%   SNAPSHOTDATA - A numeric matrix or array containing node data.
%
%   Output:
%   NODESUM - A vector containing the sum of each row of the input matrix.
%   NODEMAX - A vector containing the maximum value of each row.
%   NODEMIN - A vector containing the minimum value of each row.
%   NODEAVG - A vector containing the average value of each row.
%
%   This function:
%   1. Calculates the sum of each row in the input matrix.
%   2. Computes the average of each row.
%   3. Identifies the maximum value in each row.
%   4. Finds the minimum value in each row.
%
%   If an error occurs during the computation, the function returns empty
%   arrays for NODESUM, NODEMAX, NODEMIN, and NODEAVG.
%
%   Example:
%   [nodeSum, nodeMax, nodeMin, nodeAvg] = calc_node_sum_max_min_avg(snapshotData)
%
%   See also SUM, MEAN, MAX, MIN.
%
%   Copyright 2014-2024 Kitronyx.Inc

    try
        % Sum of all nodes (each row)
        nodeSum = sum(snapshotData, 2, "double");
        
        % Average of all nodes (each row)
        nodeAvg = mean(snapshotData, 2, "double");
        
        % Maximum value of each node (each row)
        nodeMax = max(snapshotData);
        
        % Minimum value of each node (each row)
        nodeMin = min(snapshotData);

    catch e
        % Handle any errors that occur during computation.
        disp(['Error: ', e.message]);
        nodeSum = [];
        nodeMax = [];
        nodeMin = [];
        nodeAvg = [];
    end
end
