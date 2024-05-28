clc;
clear;
close all;

measuredCol = 66;
% calculate drift rate
[driftRate, driftInfo] = CalculateDriftRate('Drift_Sample_ConvertLogFilePage 01\Drift_AdcData-1d.csv', measuredCol);

% Drift rate of all log
disp(['Drift start time: ', num2str(driftInfo.timeStart), ', Drift end time: ', num2str(driftInfo.timeEnd), ', Drift start ADC: ', ...
                                    num2str(driftInfo.adcBegin), ', Drift end ADC: ', num2str(driftInfo.adcEnd)]);

% Drift rate of all log
disp(['Drift rate of all log:',num2str(driftRate), ' %log10time']);




