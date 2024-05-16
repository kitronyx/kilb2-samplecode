function [node_sum, node_max,node_min,node_avg] = calc_node_SumMaxMinAvg(node_1d_data)
    try
        % Sum of all nodes
        node_sum = sum(node_1d_data,2,"double");
        % average of all nodes
        node_avg = mean(node_1d_data,2,"double");
        % max value of all nodes
        node_max = max(node_1d_data);
        % min value of all nodes
        node_min = min(node_1d_data);

    catch e
        disp(['Error: ', e.message]);
        node_sum = [];
        node_max = [];
        node_min = [];
        node_avg = [];
    end
end
