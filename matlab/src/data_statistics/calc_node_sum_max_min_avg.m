function [nodeSum, nodeMax,nodeMin,nodeAvg] = calc_node_sum_max_min_avg(snapshotPath)
    try
        % Sum of all nodes
        nodeSum = sum(snapshotPath,2,"double");
        % average of all nodes
        nodeAvg = mean(snapshotPath,2,"double");
        % max value of all nodes
        nodeMax = max(snapshotPath);
        % min value of all nodes
        nodeMin = min(snapshotPath);

    catch e
        disp(['Error: ', e.message]);
        nodeSum = [];
        nodeMax = [];
        nodeMin = [];
        nodeAvg = [];
    end
end
