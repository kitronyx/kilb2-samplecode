import ReadKitronyxCsv as klib


if __name__ == "__main__":
    # Read 1d snpashot data
    (row,col,data) =  klib.ReadSnapshot1DimensionData(r"snapshot_data\20240227T170929_AdcData-1d.csv")
    print("row: ",row,"col: ",col,"len: ",len(data))
    print("data: ",data)

    # Read 1d Log data
    (row,col,data_dict) =  klib.ReadConvertedLogFile1DimensionData(r"converted_log_data\20240311T142511_AdcData-1d.csv")
    print("row: ",row,"col: ",col,"len: ",len(data_dict))    
    for time_value, matrix_data in data_dict.items():
        print(f"Time value: {time_value}, Data: {matrix_data}")
