function [drift_rate] = calc_drift_rate(drift_info)
% drift_info fmt
% drift_info.Time_start
% drift_info.Time_end
% drift_info.ADC_begin
% drift_info.ADC_end

try
    [drift_rate] = (drift_info.ADC_end - drift_info.ADC_begin) / (drift_info.ADC_begin * log10(drift_info.Time_end - drift_info.Time_start))*100;
catch e
        disp(['Error: ', e.message]);
        node_XRAD = [];
end
end

