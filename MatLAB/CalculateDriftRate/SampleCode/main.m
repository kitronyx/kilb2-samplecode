clc;
clear;
close all;

% Read 1-dimensional log data.
[row, col, drift_log_times, drift_ADC_data] = Read_ConvertLogFile_1_dimension_data('Drift_Sample_ConvertLogFilePage 01\Drift_AdcData-1d.csv');
% disp(['row: ', num2str(row), ', col: ', num2str(col), ', len: ', num2str(length(data_map))]);


% mesured node col index
mesured_node_col = 66;

% drift_info fmt
drift_info.Time_start = drift_log_times{1};
drift_info.Time_end   = drift_log_times{end};
drift_info.ADC_begin  = str2double(drift_ADC_data{1}{mesured_node_col});
drift_info.ADC_end    = str2double(drift_ADC_data{numel(drift_log_times)}{mesured_node_col});

% calculate drift rate
[drift_rate] = calc_drift_rate(drift_info);

% Drift rate of all log
disp(['Drift start time: ', num2str(drift_info.Time_start), ', Drift end time: ', num2str(drift_info.Time_end), ', Drift start ADC: ', num2str(drift_info.ADC_begin), ', Drift end ADC: ', num2str(drift_info.ADC_end)]);

% Drift rate of all log
disp(['Drift rate of all log:',num2str(drift_rate), ' %log10time']);




