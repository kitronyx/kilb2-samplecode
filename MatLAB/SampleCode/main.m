
% Read 1-dimensional snapshot data.
[row, col, data] = Read_snapshot_1_dimension_data('SampleSnapshotData\20240227T170929_AdcData-1d.csv');
disp(['row: ', num2str(row), ', col: ', num2str(col), ', len: ', num2str(length(data))]);
disp('data:');
disp(data);

% Read 1-dimensional log data.
[row, col, data_map] = Read_ConvertLogFile_1_dimension_data('Sample_ConvertLogFilePage 01\20240311T142511_AdcData-1d.csv');
disp(['row: ', num2str(row), ', col: ', num2str(col), ', len: ', num2str(length(data_dict))]);

% Print all data in the map
disp('Data in the map:');
all_key = data_map.keys   ; 
all_values = data_map.values   ; 
for i = 1:numel(all_key)
    key = all_key{i};
    value = all_values{i}; 
    disp(['Key: ', key, ', Value: ', value]);
end


