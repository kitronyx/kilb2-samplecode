function [row, col, data] = ReadSnapshot1DimensionData(path)
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
