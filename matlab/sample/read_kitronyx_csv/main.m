clc;
% Read 1-dimensional snapshot data from a CSV file.
[row, col, snapshotData] = read_snapshot_1d_data('snapshot_data\20240227T170929_AdcData-1d.csv');

% Display the number of rows, columns, and the length of the data array.
disp(['row: ', num2str(row), ', col: ', num2str(col), ', len: ', num2str(length(snapshotData))]);

% Display the actual data content.
disp('data:');
disp(snapshotData);

% Read 1-dimensional log data from a CSV file.
[row, col, times, logData] = read_converted_logfile_1D_data('converted_log_data\20240227T170929_AdcData-1d.csv');

% Display the number of rows, columns, and the length of the data array.
disp(['row: ', num2str(row), ', col: ', num2str(col), ', len: ', num2str(length(logData))]);

% Print all data in the arrays by iterating through each time and corresponding data entry.
disp('Data:');
for i = 1:numel(times)
    key = times{i};  % Get the current time value.
    value = logData{i}; % Get the corresponding data value.
    % Display the time (key) and associated data (value) as a comma-separated string.
    disp(['Key: ', num2str(key), ', Value: ', strjoin(value, ', ')]);
end
