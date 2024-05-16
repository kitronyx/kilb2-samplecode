function [node_std, node_rsd] = calc_node_rsd(node_1d_data)
    try
        % calculate Relative Standard deviation(RSD)
        node_std = std(node_1d_data);
        node_rsd = (node_std/mean(node_1d_data,2,"double"))*100;

    catch e
        disp(['Error: ', e.message]);
        node_std = [];
        node_rsd = [];
    end
end
