clc;        % Clear the command window.

% Read 1-dimensional snapshot data from a CSV file.
[row, col, data] = read_snapshot_1d_data('snapshot_data\20240227T170929_AdcData-1d.csv');

% Convert the data from strings to double precision numbers.
data = str2double(data);

% Calculate sum, max, min, and average values of all nodes.
[nodeSum, nodeMax, nodeMin, nodeAvg] = calc_node_sum_max_min_avg(data);

% Display the sum of all nodes.
disp('Sum of all nodes:');
disp(nodeSum);

% Display the maximum value of all nodes.
disp('Max value of all nodes:');
disp(nodeMax);

% Display the minimum value of all nodes.
disp('Min value of all nodes:');
disp(nodeMin);

% Display the average value of all nodes.
disp('Average of all nodes:');
disp(nodeAvg);

% Calculate the standard deviation and relative standard deviation (RSD) of all nodes.
[nodeStd, nodeRsd] = calc_node_rsd(data);

% Display the standard deviation of all nodes.
disp('Standard deviation of all nodes:');
disp(nodeStd);

% Display the relative standard deviation (RSD) of all nodes.
disp('%RSD of all nodes:');
disp(nodeRsd);

% Calculate the XRAD value for all nodes.
[nodeXrad] = calc_node_xrad(data);

% Display the XRAD value of all nodes.
disp('%XRAD of all nodes:');
disp(nodeXrad);
