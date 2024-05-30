# klib2-ReadKitronyxCsv
 GitHub repository for reading Kitronyx snapshot files and log files

# Code Purpose
Collection of sample code and source code in various programming languages for aggregating data from Snapshot and Log folders' converted CSV files using Kitornyx products


# FolderTree
```
read_kitronyx_csv
|   README.md
|   README.pdf
|
+---res
|       PythonSampleResult.png
|
+---sample
|   |   main.py
|   |   ReadKitronyxCsv.py
|   |
|   +---SampleSnapshotData
|   |       20240227T170929_AdcData-1d.csv
|   |       20240227T170929_AdcData-2d.csv
|   |       20240227T170929_ForceData-1d.csv
|   |       20240227T170929_ForceData-2d.csv
|   |       20240227T170929_snapshot-frame.jpg
|   |       20240227T170929_snapshot-real_time_analyzer.jpg
|   |
|   \---Sample_ConvertLogFilePage 01
|           20240311T142511_AdcData-1d.csv
|           20240311T142511_AdcData-2d.csv
|           20240311T142511_ForceData-1d.csv
|           20240311T142511_ForceData-2d.csv
|
\---src
        ReadKitronyxCsv.py
```
# Python
Program tools : Vs Code (Vesion 1.87.1)  
Vs code Python Version: v2024.2.1  
 ## Code Description
 ```
ReadKitronyxCsv.py
    -.Collection of functions to read Kitronyx snapshot and log CSV files
      
    def ReadSnapshot1DimensionData(_path):
    - Function to read snapshot 1D files
    - Takes a 1D CSV path as a parameter and returns [row, col, data]
    - row: ROW - number of columns
    - col: COL - number of rows
    - data: Matrix data of size ROW*COL

    def ReadConvertedLogFile1DimensionData(_path):
    - Function to read log 1D files
    - Takes a 1D CSV path as a parameter and returns [row, col, data_dict]
    - row: ROW - number of columns
    - col: COL - number of rows
    - data_dict: Dictionary format data
        - keys: Time values
        - values: Matrix data of size ROW*COL

```

![sample code image](res/PythonSampleResult.png)
