
% Read 1-dimensional snapshot data.
[row, col, data] = read_snapshot_1d_data('snapshot_data\20240227T170929_AdcData-1d.csv');
disp(['row: ', num2str(row), ', col: ', num2str(col), ', len: ', num2str(length(data))]);
disp('data:');
disp(data);

% Read 1-dimensional log data.
[row, col, times, data] = read_converted_logfile_1D_data('converted_log_data\20240227T170929_AdcData-1d.csv');
disp(['row: ', num2str(row), ', col: ', num2str(col), ', len: ', num2str(length(data))]);

% Print all data in the arrays
disp('Data:');
for i = 1:numel(times)
    key = times{i};
    value = data{i};
    disp(['Key: ', num2str(key), ', Value: ', strjoin(value, ', ')]);
end



