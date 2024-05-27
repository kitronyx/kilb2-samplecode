function [nodeXrad] = CalcNodeXRAD(snapshotPath)
    try
        
        % average of all nodes
        nodeAvg = mean(snapshotPath,2,"double");
        % max value of all nodes
        nodeMax = max(snapshotPath);
        % min value of all nodes
        nodeMin = min(snapshotPath);

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
