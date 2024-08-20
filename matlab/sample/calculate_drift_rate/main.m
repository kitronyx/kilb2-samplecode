clc;  % Clear the command window.

measuredCol = 66;  % Define the column number to be measured for drift.

% Calculate drift rate using the specified log file and measured column.
[driftRate, driftInfo] = calcualte_drift_rate('converted_log_data\Drift_AdcData-1d.csv', measuredCol);

% Display the drift information including start time, end time, start ADC value, and end ADC value.
disp(['Drift start time: ', num2str(driftInfo.timeStart), ', Drift end time: ', num2str(driftInfo.timeEnd), ...
      ', Drift start ADC: ', num2str(driftInfo.adcBegin), ', Drift end ADC: ', num2str(driftInfo.adcEnd)]);

% Display the calculated drift rate as a percentage per log10 time.
disp(['Drift rate of all log: ', num2str(driftRate), ' %log10time']);
