classdef ResBankEconData
    %RESBANKECONDATA class that provides methods for retrieving economic data from the South African
    % Reserve Bank (SARB) web API. It serves as an interface to access various economic datasets available through
    % the API. The class is designed to encapsulate the API interaction and data retrieval process, making it easier
    % to fetch specific economic data.
    %
    % Example usage:
    %  Instantiate the ResBankEconData object and specify the type of economic data.
    %  rb = ResBankEconData("CurrentMarketRates");
    %
    %  % Fetch the data for current market rates.
    %  currentMarketRatesData = rb.fetchData();
    %
    %  % Fetch the GDP from 2020-01-01 to 2023-01-01.
    %  timeSeriesCode = 'NRI6006L';
    %  startDate = "2020-01-01";
    %  endDate = "2023-01-01";
    %  historicalExchangeRatesData = rb.fetchTimeSeries(timeSeriesCode, startDate, endDate);

    properties
        API (1, 1) string
        WebIndicatorURL (1, 1) string
        TimeSeries (1, 1) string
    end

    properties
        EconDataType (1, 1) string
    end

    methods
        function this = ResBankEconData(typeOfEconData)

            arguments
                typeOfEconData (1, 1) string {mustBeText} = "HomePageRates"
            end

            this.EconDataType = typeOfEconData;
            this.WebIndicatorURL = getConfigParam(typeOfEconData, fullfile("Config.json"));
            this.API = getConfigParam("API", fullfile("Config.json"));
            this.TimeSeries = getConfigParam("TimeSeries", fullfile("Config.json"));
        end
    end

    methods
        function outputTable = fetchData(this)
            % fetches the economic data tables from SARB

            urlFull = strcat(this.API, this.WebIndicatorURL);
            outputTable = webread(urlFull);
            outputTable = struct2table(outputTable);
        end

        function outputTable = fetchTimeSeries(this, timeSeriesCode, startDate, endDate)
            % gets time series data and output as table

            % PROPERTIES:
            % timeSeriesCode: code for the time series to retrieve data
            % for. Defaults to GDP
            % startDate: start date for the time series, in the format
            % 'yyyy-MM-dd'. Defaults to the earliest date available
            % endDate: end date for the time series, in the format
            % 'yyyy-MM-dd'. Defaults to the latest date

            arguments
                this
                timeSeriesCode (1, 1) string {mustBeNonzeroLengthText}
                startDate (1, 1) string {mustBeText} = '0001-01-01'
                endDate (1, 1) string {mustBeText} = datetime("today")
            end

            urlFull = strcat(this.API, this.TimeSeries, timeSeriesCode, "/", startDate, "/", endDate);

            structIn = webread(urlFull);
            outputTable = ResBankEconData.cleanTimeSeries(structIn);
        end

        function sectData = selectedStatisticsRelease(this, code)
            % Gets specified data from selected statistics release table

            arguments
                this
                code (1, 1) string {mustBeText} = ""
            end
            conn = ResBankEconData("SelectedStatisticsRelease");
            availableCodes = conn.fetchData();
            validCodes = availableCodes.DataType;

            if (code == "")
                disp(availableCodes)
                code = input("Input a DataType from the table: ","s");
            end

            code = upper(string(code));
            checkValidity = ismember(code,validCodes);

            while checkValidity == false
                fprintf("Error: Invalid DataType. \n\n")
                code = input("Input a valid DataType: ","s");
                code = upper(string(code));
                checkValidity = ismember(code,validCodes);
            end

            urlFull = strcat(this.API, conn.WebIndicatorURL, '/MonthlyIndicatorsAll/', code);
            sectData = webread(urlFull);
            sectData = struct2table(sectData);

            [~,idx,~] = unique(sectData(:,3),'stable');
            sectData = sectData(idx,:);

            sectData = sectData(:, ["TimeSeriesCode" "CategoryName" "MeasureName" ...
                "Period" "FormatDate"]);
        end
    end

    methods (Static)

        function tsOut = cleanTimeSeries(structIn)
            % cleans time series table
            arguments
                structIn (1, :) struct {mustBeNonempty}
            end

            tsIn = struct2table(structIn);
            tsIn.Period = datetime(tsIn.Period);
            tsOut = table2timetable(tsIn);
            tsOut = tsOut(:, "Value");
            tsOut = sortrows(tsOut, "Period");
        end
    end

end