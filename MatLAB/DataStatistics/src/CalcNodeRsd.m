function [nodeStd, nodeRsd] = CalcNodeRsd(snapshotPath)
    try
        % calculate Relative Standard deviation(RSD)
        nodeStd = std(snapshotPath);
        nodeRsd = (nodeStd/mean(snapshotPath,2,"double"))*100;

    catch e
        disp(['Error: ', e.message]);
        nodeStd = [];
        nodeRsd = [];
    end
end
