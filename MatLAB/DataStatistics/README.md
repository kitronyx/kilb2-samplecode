# kilb2-SampleCode
 GitHub repository for reading Kitronyx snapshot files and log files

# Code Purpose
Collection of sample code and source code in various programming languages for aggregating data from Snapshot and Log folders' converted CSV files using Kitornyx products


# FolderTree
```
DataStatistics
│  README.md
│  README.pdf
│
├─res
│      MatLABSampleResult.png
│
├─SampleCode
│  │  CalcNodeRsd.m
│  │  CalcNodeSumMaxMinAvg.m
│  │  CalcNodeXRAD.m
│  │  main.m
│  │  ReadSnapshot1DimensionData.m
│  │
│  └─SampleSnapshotData
│          20240227T170929_AdcData-1d.csv
│          20240227T170929_AdcData-2d.csv
│          20240227T170929_ForceData-1d.csv
│          20240227T170929_ForceData-2d.csv
│          20240227T170929_snapshot-frame.jpg
│          20240227T170929_snapshot-real_time_analyzer.jpg
│
└─src
        CalcNodeRsd.m
        CalcNodeSumMaxMinAvg.m
        CalcNodeXRAD.m
```

# MATLAB
Version: R2023b Update 7 (23.2.0.2515942) 64bit January 30, 2024  

## Code Description
```
CalcNodeSumMaxMinAvg.m
    - MATLAB file containing a function to calculate sum, average, maximum, and minimum values for all nodes.
    - Returns [nodeSum, nodeMax,nodeMin,nodeAvg] when given a 1D matrix data as a parameter.
    - nodeSum: Sum of all nodes
    - nodeAvg: Average of all nodes
    - nodeMax: Max value of all nodes
    - nodeMin: Min value of all nodes

CalcNodeRsd.m
    - MATLAB file containing a function to calculate Standard deviation and Relative Standard deviation values for all nodes.
    - Returns [nodeStd, nodeRsd] when given a 1D matrix data as a parameter.
    - nodeStd: Standard deviation of all nodes
    - nodeRsd: %RSD of all nodes

CalcNodeXRAD.m
    - MATLAB file containing a function to calculate %XRAD values for all nodes.
    - Returns [nodeXrad] when given a 1D matrix data as a parameter.
    - nodeXrad: %XRAD of all nodes

```

![sample code image](res/MatLABSampleResult.png)
