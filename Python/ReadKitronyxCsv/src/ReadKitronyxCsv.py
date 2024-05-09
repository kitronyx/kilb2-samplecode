from asyncio.windows_events import NULL
import csv

def Read_snapshot_1_dimension_data(path):
    try:
        with open(path, 'r') as csvfile:
            csv_reader = csv.reader(csvfile)
            csv_header = next(csv_reader)
            dimension_info = csv_header[-1]

            # Read row and column size
            if dimension_info in ("", "\n"):
                dimension_info = csv_header[-2]
                if dimension_info in ("", "\n"):
                    print("Error: CSV data is incorrect")
                    return None, None, None

            # Extract row and column numbers (e.g., R47C47 --> row: 48, col: 48)
            row = int(dimension_info.split('C')[0].replace('R', '')) + 1
            col = int(dimension_info.split('C')[1]) + 1

            # Skip the first data (time value) and return data
            data = next(csv_reader)[1:row * col + 1]
            return row, col, data
    except Exception as e:
        print("Error:", e)
        return None, None, None


def Read_ConvertLogFile_1_dimension_data(path):
    try:
        with open(path, 'r') as csvfile:
            csv_reader = csv.reader(csvfile)
            csv_header = next(csv_reader)
            dimension_info = csv_header[-1]

            # Read row and column size
            if dimension_info in ("", "\n"):
                dimension_info = csv_header[-2]
                if dimension_info in ("", "\n"):
                    print("Error: CSV data is incorrect")
                    return None, None, None
                
            # Extract row and column numbers (e.g., R47C47 --> row: 48, col: 48)
            row = int(dimension_info.split('C')[0].replace('R', '')) + 1
            col = int(dimension_info.split('C')[1]) + 1

            #Read time value and matrix data, store in dictionary
            data_dict = {}
            for line_data in csv_reader:
                time_value = line_data[0]
                matrix_data = line_data[1:row * col + 1]
                data_dict[time_value] = matrix_data

            return row, col, data_dict    
    except Exception as e:
        print("Error:", e)
        return None, None, None