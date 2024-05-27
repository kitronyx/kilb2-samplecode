function [row, col, data_map] = ReadConvertLogFile1DimensionData(path)
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
                data_map = [];
                return;
            end
        end

        % Extract row and column numbers (e.g., R47C47 --> row: 48, col: 48)
        splitStr = strsplit(dimension_info, 'C');
        row = str2double(strrep(splitStr(1), 'R', '')) + 1;
        col = str2double(splitStr(2)) + 1;

        % Read time value and matrix data, store in map
        data_map = containers.Map();
        while ~feof(fid)
            line_data = strsplit(fgetl(fid), ',');
            time_value = line_data{1};
            matrix_data = line_data(2:row * col + 1);
            data_map(time_value) = matrix_data;
        end
        fclose(fid);
    catch e
        disp(['Error: ', e.message]);
        row = [];
        col = [];
        data_map = containers.Map();
    end
end