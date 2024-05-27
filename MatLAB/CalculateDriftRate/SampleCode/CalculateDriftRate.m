function [drfitRate, driftInfo] = CalculateDriftRate(logPath, measuredCol)

% Read 1-dimensional log data.
[row, col, driftLogTimes, driftAdcData] = ReadConvertLogFile1DimensionData(logPath);

%struct info
% driftInfo.timeStart
% driftInfo.timeEnd
% driftInfo.adcBegin
% driftInfo.adcEnd
driftInfo.timeStart = driftLogTimes{1};
driftInfo.timeEnd   = driftLogTimes{end};
driftInfo.adcBegin  = str2double(driftAdcData{1}{measuredCol});
driftInfo.adcEnd    = str2double(driftAdcData{numel(driftLogTimes)}{measuredCol});

try
    [drfitRate] = (driftInfo.adcEnd - driftInfo.adcBegin) / (driftInfo.adcBegin * log10(driftInfo.timeEnd - driftInfo.timeStart))*100;
catch e
        disp(['Error: ', e.message]);
        drfitRate = [];
end
end