import ReadKitronyxCsv as klib

if __name__ == "__main__":
    # Read 1-dimensional snapshot data from the specified CSV file
    (row, col, data) = klib.ReadSnapshot1DimensionData(r"snapshot_data\20240227T170929_AdcData-1d.csv")
    
    # Display the number of rows, columns, and the length of the data array
    print("row: ", row, "col: ", col, "len: ", len(data))
    
    # Display the actual data content from the snapshot file
    print("data: ", data)

    # Read 1-dimensional log data from the specified CSV file
    (row, col, data_dict) = klib.ReadConvertedLogFile1DimensionData(r"converted_log_data\20240311T142511_AdcData-1d.csv")
    
    # Display the number of rows, columns, and the length of the data dictionary
    print("row: ", row, "col: ", col, "len: ", len(data_dict))
    
    # Iterate through the log data dictionary and print each time value and its corresponding data
    for time_value, matrix_data in data_dict.items():
        print(f"Time value: {time_value}, Data: {matrix_data}")
