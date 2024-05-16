clc;
clear ;
close all;


% Read 1-dimensional snapshot data.
[row, col, data] = Read_snapshot_1_dimension_data('SampleSnapshotData\20240227T170929_AdcData-1d.csv');

data = str2double(data);

% calculate sum, max, min, average value of all nodes
[node_sum, node_max,node_min,node_avg] = calc_node_SumMaxMinAvg(data);

% Sum of all nodes
disp('sum of all nodes:');
disp(node_sum);
% max value of all nodes
disp('max value of all nodes:');
disp(node_max);
% min value of all nodes
disp('min value of all nodes:');
disp(node_min);
% average of all nodes
disp('average of all nodes:');
disp(node_avg);


% calculate Relative Standard deviation(RSD)
[node_std, node_rsd] = calc_node_rsd(data);

% Standard deviation of all nodes
disp('Standard deviation of all nodes:');
disp(node_std);
% Relative Standard deviation(RSD) of all nodes
disp('%RSD of all nodes:');
disp(node_rsd);

[node_XRAD] = calc_node_XRAD(data);

% %XRAD of all nodes
disp('%XRAD of all nodes:');
disp(node_XRAD);