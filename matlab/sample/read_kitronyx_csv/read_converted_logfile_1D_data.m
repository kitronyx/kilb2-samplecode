function [row, col, times, data] = read_converted_logfile_1D_data(path)
%READ_CONVERTED_LOGFILE_1D_DATA Reads a logfile and extracts 1D data.
%   READ_CONVERTED_LOGFILE_1D_DATA(PATH) reads a CSV logfile 
%   specified by PATH and extracts the dimensions, timestamps, 
%   and data matrix contained within the file.
%
%   Input:
%   PATH - A string that specifies the path to the logfile.
%
%   Output:
%   ROW    - The number of rows in the data matrix.
%   COL    - The number of columns in the data matrix.
%   TIMES  - A cell array containing the timestamps of the data entries.
%   DATA   - A cell array containing the corresponding data matrices.
%
%   The function:
%   1. Reads the first line to extract matrix dimensions.
%   2. Parses each subsequent line to retrieve the timestamp and associated data.
%   3. Stores the parsed data in the TIMES and DATA arrays.
%   4. Sorts the TIMES array and reorders the DATA array accordingly.
%
%   If an error occurs while processing the file, the function returns
%   empty arrays for ROW, COL, TIMES, and DATA.
%
%   Example:
%   [row, col, times, data] = read_converted_logfile_1D_data('data.csv')
%
%   See also FOPEN, FGETL, STRSPLIT, STR2DOUBLE.
%   Copyright 2014-2024 Kitronyx.Inc

    try
        % Open the file
        fid = fopen(path, 'r');
        
        % Read the first line
        first_line = fgetl(fid);
        
        % Split all columns of the first line by ','
        columns = strsplit(first_line, ',');
        
        % Get the value of the last column
        dimension_info = columns{end};

        % Read row and column size
        if isempty(dimension_info) || strcmp(dimension_info, '\n')
            dimension_info = columns{end-1};
            if isempty(dimension_info) || strcmp(dimension_info, '\n')
                disp('Error: CSV data is incorrect');
                row = [];
                col = [];
                times = {};
                data = {};
                return;
            end
        end

        % Extract row and column numbers (e.g., R47C47 --> row: 48, col: 48)
        splitStr = strsplit(dimension_info, 'C');
        row = str2double(strrep(splitStr{1}, 'R', '')) + 1;
        col = str2double(splitStr{2}) + 1;

        % Initialize arrays to store time values and corresponding data
        times = {};
        data = {};
        
        % Read time value and matrix data
        while ~feof(fid)
            line_data = strsplit(fgetl(fid), ',');
            time_value = str2double(line_data{1});
            matrix_data = line_data(2:row * col + 1);
            
            % Store the time value and corresponding data
            times{end+1} = time_value;
            data{end+1} = matrix_data;
        end
        fclose(fid);
        
        % Convert times to numeric values for correct sorting
        numeric_times = cell2mat(times);
        
        % Sort the numeric times and get sorted indices
        [sorted_numeric_times, sort_idx] = sort(numeric_times);
        
        % Reorder times and data based on sorted indices
        times = num2cell(sorted_numeric_times);
        data = data(sort_idx);
        
    catch e
        disp(['Error: ', e.message]);
        row = [];
        col = [];
        times = {};
        data = {};
    end
end
