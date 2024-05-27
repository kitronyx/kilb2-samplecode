# kilb2-SampleCode
 GitHub repository for reading Kitronyx snapshot files and log files

# Code Purpose
Collection of sample code and source code in various programming languages for aggregating data from Snapshot and Log folders' converted CSV files using Kitornyx products

# FolderTree
```
CalculateDriftRate
│  README.md
│  README.pdf
│
├─res
│      MatLABSampleResult.png
│
├─SampleCode
│  │  CalcDriftRate.m
│  │  main.m
│  │  ReadConvertLogFile1DimensionData.m
│  │
│  └─Drift_Sample_ConvertLogFilePage 01
│          Drift_AdcData-1d.csv
│          Drift_AdcData-2d.csv
│
├─src
│        CalcDriftRate.m
│        ReadConvertLogFile1DimensionData.m
```


# MATLAB
Version: R2023b Update 7 (23.2.0.2515942) 64bit January 30, 2024  

## Code Description
```
CalcDriftRate.m
    - MATLAB file containing a function to calculate drift rate for all log data
    - Returns [drift_rate, driftInfo] when given a drift value and drift information struct.
    - drift infomation struct format example:
        - driftInfo.timeStart
        - driftInfo.timeEnd
        - driftInfo.adcBegin
        - driftInfo.adcEnd 
```
![sample code image](res/MatLABSampleResult.png)
