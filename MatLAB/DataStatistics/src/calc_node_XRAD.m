function [node_XRAD] = calc_node_XRAD(node_1d_data)
    try
        
        % average of all nodes
        node_avg = mean(node_1d_data,2,"double");
        % max value of all nodes
        node_max = max(node_1d_data);
        % min value of all nodes
        node_min = min(node_1d_data);

        % %XRAD of all nodes
        if (node_avg - node_min) > (node_max - node_min) 
           node_XRAD = ((node_avg - node_min) / node_avg)*100;
        else
           node_XRAD = ((node_max - node_avg) / node_avg)*100;
        end

    catch e
        disp(['Error: ', e.message]);
        node_XRAD = [];
    end
end
