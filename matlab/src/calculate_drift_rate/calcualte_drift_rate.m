function [drfitRate, driftInfo] = calcualte_drift_rate(logPath, measuredCol)
%CALCULATE_DRIFT_RATE Calculates the drift rate from log data.
%   CALCULATE_DRIFT_RATE(LOGPATH, MEASUREDCOL) reads the 1-dimensional log data
%   from the specified log file (LOGPATH) and calculates the drift rate for a specified column (MEASUREDCOL).
%
%   Input:
%   LOGPATH      - A string specifying the path to the log file.
%   MEASUREDCOL  - The column number to be measured for drift.
%
%   Output:
%   DRFITRATE    - The calculated drift rate as a percentage.
%   DRIFTINFO    - A structure containing the following fields:
%                  - timeStart: The start time of the log data.
%                  - timeEnd: The end time of the log data.
%                  - adcBegin: The initial ADC value at the start time.
%                  - adcEnd: The final ADC value at the end time.
%
%   This function:
%   1. Reads the log data using the provided log path.
%   2. Extracts the start and end times, as well as the corresponding ADC values
%      for the specified column.
%   3. Calculates the drift rate using the formula:
%      ((adcEnd - adcBegin) / (adcBegin * log10(timeEnd - timeStart))) * 100
%
%   If an error occurs during the computation, the function returns an empty
%   array for DRFITRATE.
%
%   Example:
%   [drfitRate, driftInfo] = calcualte_drift_rate('logfile.csv', 3)
%
%   See also READ_CONVERTED_LOGFILE_1D_DATA.
%
%   Copyright 2014-2024 Kitronyx.Inc


% Read 1-dimensional log data.
[row, col, driftLogTimes, driftAdcData] = read_converted_logfile_1D_data(logPath);

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