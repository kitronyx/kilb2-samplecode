# Code Purpose
This repository contains a collection of sample code and source code in **Python** for aggregating data from Snapshot and Log folders' converted CSV files using Kitronyx products.


# FolderTree
```
│  README.md
│  README.pdf
│
├─res
│      read_kitronyx_csv.png
│
├─sample
│  └─read_kitronyx_csv
│      │  main.py
│      │  ReadKitronyxCsv.py
│      │
│      ├─converted_log_data
│      │
│      └─snapshot_data
│
└─src
    └─read_kitronyx_csv
            ReadKitronyxCsv.py
```
# Python
Program tools : Visual Studio Code 1.92.2 (user setup)  
                Electron: 30.1.2  
Visual Studio Code Python Version: v2024.2.1    

# How to Use Sample Code
To run the sample code in the sample folder:

1. Navigate to the Folder:
        Go to the appropriate subfolder under sample/ where the main.py file is located   
        (e.g., sample/read_kitronyx_csv, sample/calculate_drift_rate, etc.).
2. Run the Main Script:
    Execute the main.py file in that folder to run the sample code.   
    This will demonstrate how to use the functions provided in the corresponding module.  
```
python main.py
```
This approach allows you to test and observe how each function processes the data from the provided CSV files in any specific context.

 ## Code Description

 ### ReadKitronyxCsv
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

![sample code image](res/read_kitronyx_csv.png)
