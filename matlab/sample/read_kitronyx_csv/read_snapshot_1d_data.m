function [row, col, data] = read_snapshot_1d_data(path)
%READ_SNAPSHOT_1D_DATA Reads a snapshot of 1D data from a CSV file.
%   READ_SNAPSHOT_1D_DATA(PATH) reads a CSV file specified by PATH,
%   extracts the matrix dimensions, and retrieves the corresponding data.
%
%   Input:
%   PATH - A string specifying the path to the CSV file.
%
%   Output:
%   ROW   - The number of rows in the data matrix.
%   COL   - The number of columns in the data matrix.
%   DATA  - A cell array containing the data from the file, excluding the first (time) value.
%
%   This function:
%   1. Opens the specified file.
%   2. Reads the first line to extract the matrix dimensions.
%   3. Parses the row and column sizes from the last column.
%   4. Extracts and returns the data from the second line onward, 
%      excluding the first time value.
%
%   If an error occurs during file processing, the function returns empty arrays 
%   for ROW, COL, and DATA.
%
%   Example:
%   [row, col, data] = read_snapshot_1d_data('snapshot.csv')
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
                data = [];
                return;
            end
        end

        % Extract row and column numbers (e.g., R47C47 --> row: 48, col: 48)
        splitStr = strsplit(dimension_info, 'C');
        row = str2double(strrep(splitStr(1), 'R', '')) + 1;
        col = str2double(splitStr(2)) + 1;


        % Skip the first data (time value) and return the remaining data
        data = strsplit(fgetl(fid), ','); % Read the first line and split by ','
        data = data(2:(row * col + 1)); % Exclude the first node and keep the remaining data
        fclose(fid); % Close the file

    catch e
        disp(['Error: ', e.message]);
        row = [];
        col = [];
        data = [];
    end
end
