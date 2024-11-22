function [paramValue] = getConfigParam(paramName, configFilePath)
    
    arguments  (Repeating)
        paramName
        configFilePath 
    end
    
    rawContent = fileread(configFilePath{1});
    configStruct = jsondecode(rawContent);
    
    paramValue = getParamFromStruct(configStruct, paramName{:});
    
end

function [paramValue] = getParamFromStruct(paramStruct, paramName)
    arguments
        paramStruct
    end
    arguments (Repeating)
        paramName
    end
    
    if isempty(paramName)
        paramValue = paramStruct;
    else
        nextParam = paramStruct.(paramName{1});
        paramValue = getParamFromStruct(nextParam, paramName{2:end});
    end
end
