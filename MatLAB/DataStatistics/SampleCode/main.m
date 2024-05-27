clc;
clear ;
close all;


% Read 1-dimensional snapshot data.
[row, col, data] = ReadSnapshot1DimensionData('SampleSnapshotData\20240227T170929_AdcData-1d.csv');

data = str2double(data);

% calculate sum, max, min, average value of all nodes
[nodeSum, nodeMax,nodeMin,nodeAvg] = CalcNodeSumMaxMinAvg(data);

% Sum of all nodes
disp('sum of all nodes:');
disp(nodeSum);
% max value of all nodes
disp('max value of all nodes:');
disp(nodeMax);
% min value of all nodes
disp('min value of all nodes:');
disp(nodeMin);
% average of all nodes
disp('average of all nodes:');
disp(nodeAvg);


% calculate Relative Standard deviation(RSD)
[nodeStd, nodeRsd] = CalcNodeRsd(data);

% Standard deviation of all nodes
disp('Standard deviation of all nodes:');
disp(nodeStd);
% Relative Standard deviation(RSD) of all nodes
disp('%RSD of all nodes:');
disp(nodeRsd);

[nodeXrad] = CalcNodeXRAD(data);

% %XRAD of all nodes
disp('%XRAD of all nodes:');
disp(nodeXrad);