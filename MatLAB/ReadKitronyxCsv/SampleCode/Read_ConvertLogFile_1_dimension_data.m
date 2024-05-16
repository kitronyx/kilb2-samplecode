function [row, col, times, data] = Read_ConvertLogFile_1_dimension_data(path)
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
