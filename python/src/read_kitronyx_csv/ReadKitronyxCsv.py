from asyncio.windows_events import NULL
import csv

def ReadSnapshot1DimensionData(_path):
    """
    Reads a 1-dimensional snapshot CSV file and extracts row, column, and data.
    
    Parameters:
    _path (str): The path to the snapshot CSV file.
    
    Returns:
    tuple: A tuple containing the number of rows, the number of columns, and the data array.
           Returns (None, None, None) if an error occurs.
    """
    try:
        with open(_path, 'r') as csvfile:
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


def ReadConvertedLogFile1DimensionData(_path):
    """
    Reads a 1-dimensional converted log CSV file and extracts row, column, and data dictionary.
    
    Parameters:
    _path (str): The path to the converted log CSV file.
    
    Returns:
    tuple: A tuple containing the number of rows, the number of columns, and a dictionary of data.
           The dictionary keys are time values and the values are corresponding data arrays.
           Returns (None, None, None) if an error occurs.
    """
    try:
        # Open the CSV file for reading
        with open(_path, 'r') as csvfile:
            csv_reader = csv.reader(csvfile)

            # Read the header to extract dimension information
            csv_header = next(csv_reader)
            dimension_info = csv_header[-1]

            # Check for empty or invalid dimension info, fallback to previous column if necessary           
            if dimension_info in ("", "\n"):
                dimension_info = csv_header[-2]
                if dimension_info in ("", "\n"):
                    print("Error: CSV data is incorrect")
                    return None, None, None
                
            # Extract row and column numbers from the dimension info
            # Example format: R47C47 --> row: 48, col: 48
            row = int(dimension_info.split('C')[0].replace('R', '')) + 1
            col = int(dimension_info.split('C')[1]) + 1
            
            # Initialize an empty dictionary to store time and corresponding data
            data_dict = {}

            # Read each line of the CSV file
            for line_data in csv_reader:
                time_value = line_data[0]  # Extract the time value (first column)
                matrix_data = line_data[1:row * col + 1]  # Extract the data matrix
                data_dict[time_value] = matrix_data  # Store the data matrix with the time as the key


            return row, col, data_dict    
    except Exception as e:
        print("Error:", e)
        return None, None, None