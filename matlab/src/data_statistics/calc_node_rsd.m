function [nodeStd, nodeRsd] = calc_node_rsd(snapshotData)
%CLAC_NODE_RSD Calculates the standard deviation and relative standard deviation (RSD) for node data.
%   [NODESTD, NODERSD] = CLAC_NODE_RSD(SNAPSHOTDATA) calculates the standard
%   deviation (STD) and the relative standard deviation (RSD) for the provided
%   node data matrix or array (SNAPSHOTDATA).
%
%   Input:
%   SNAPSHOTDATA - A numeric matrix or array containing node data.
%
%   Output:
%   NODESTD - A vector containing the standard deviation for each row of the input matrix.
%   NODERSD - A vector containing the relative standard deviation (RSD) for each row,
%             expressed as a percentage.
%
%   This function:
%   1. Calculates the standard deviation for each row in the input matrix.
%   2. Computes the relative standard deviation (RSD) by dividing the standard deviation
%      by the mean of each row and then multiplying by 100 to express it as a percentage.
%
%   If an error occurs during the computation, the function returns empty arrays
%   for NODESTD and NODERSD.
%
%   Example:
%   [nodeStd, nodeRsd] = calc_node_rsd(snapshotData)
%
%   See also STD, MEAN.
%
%   Copyright 2014-2024 Kitronyx.Inc

    try
        % calculate Relative Standard deviation(RSD)
        nodeStd = std(snapshotData);
        nodeRsd = (nodeStd/mean(snapshotData,2,"double"))*100;

    catch e
        disp(['Error: ', e.message]);
        nodeStd = [];
        nodeRsd = [];
    end
end
