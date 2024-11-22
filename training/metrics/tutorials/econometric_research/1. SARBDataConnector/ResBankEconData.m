classdef ResBankEconData
    %ResBankEconData that contains methods for retrieving economic data from the South African Reserve Bank (SARB) web API.
    %
    % PROPERTIES:
    % API: the base URL of the SARB web API.
    % HomePageRates: the URL path for retrieving the homepage rates from the SARB web API.
    % CurrentMarketRates: the URL path for retrieving the current market rates from the SARB web API.
    % CPDRates: the URL path for retrieving the CPD rates from the SARB web API.
    % HistoricalExchangeRatesDaily: the URL path for retrieving the historical exchange rates (daily) from the SARB web API.
    % HistoricalExchangeRatesMonthly: the URL path for retrieving the historical exchange rates (monthly) from the SARB web API.
    % ReleaseOfSelectedData: the URL path for retrieving the release of selected data from the SARB web API.
    % LastUpdatePeriod: the URL path for retrieving the last update period from the SARB web API.
    % RealSectorData: the URL path for retrieving the real sector data from the SARB web API.
    % FiscalSectorData: the URL path for retrieving the fiscal sector data from the SARB web API.
    % FinancialSectorData: the URL path for retrieving the financial sector data from the SARB web API.
    % ExternalSectorData: the URL path for retrieving the external sector data from the SARB web API.
    % PopulationData: the URL path for retrieving the population data from the SARB web API.
    % HistoricalDatesOfRateChanges: the URL path for retrieving the historical dates of rate changes from the SARB web API.

    properties (Constant)
        API string = 'https://custom.resbank.co.za/SarbWebApi/';
        HomePageRates string ='WebIndicators/HomePageRates';
        CurrentMarketRates string ='WebIndicators/CurrentMarketRates';
        CPDRates string='WebIndicators/CPDRates';
        HistoricalExchangeRatesDaily string='WebIndicators/HistoricalExchangeRatesDaily';
        HistoricalExchangeRatesMonthly	string='WebIndicators/HistoricalExchangeRatesMonthly';
        ReleaseOfSelectedData string='WebIndicators/ReleaseOfSelectedData';
        RealSectorData string='WebIndicators/EconFinDataForSA/GetRealSectorData';
        FiscalSectorData string='WebIndicators/EconFinDataForSA/GetFiscalSectorData';
        FinancialSectorData	string='WebIndicators/EconFinDataForSA/GetFinancialSectorData';
        ExternalSectorData string='WebIndicators/EconFinDataForSA/GetExternalSectorData';
        PopulationData string='WebIndicators/EconFinDataForSA/GetPopulationData';
        HistoricalDatesOfRateChanges string='WebIndicators/OtherIndicators/HistoricalDatesOfRateChanges';

    end

    methods (Static)
        function outputTable = retrieveData(inputArg,this)
            %RETRIEVEDATA retrieves data from the SARB web API
            %
            % PROPERTIES:
            % this: A ResBankEconData object
            % inputArg: input argument from the user to request data

            arguments
                inputArg string;
                this = ResBankEconData;
            end

            % Use switch statement to determine which URL to use based on input argument
            switch inputArg
                case 'HomePageRates'
                    table = webread(this.API+this.HomePageRates);

                case 'CurrentMarketRates'
                    table = webread(this.API+this.CurrentMarketRates);

                case 'CPDRates'
                    table = webread(this.API+this.CPDRates);

                case 'HistoricalExchangeRatesDaily'
                    table = webread(this.API+this.HistoricalExchangeRatesDaily);

                case 'HistoricalExchangeRatesMonthly'
                    table = webread(this.API+this.HistoricalExchangeRatesMonthly);

                case 'ReleaseOfSelectedData'
                    table = webread(this.API+this.ReleaseOfSelectedData);

                case 'RealSectorData'
                    table = webread(this.API+this.RealSectorData);

                case 'FiscalSectorData'
                    table = webread(this.API+this.FiscalSectorData);

                case 'FinancialSectorData'
                    table = webread(this.API+this.FinancialSectorData);

                case 'ExternalSectorData'
                    table = webread(this.API+this.ExternalSectorData);

                case 'PopulationData'
                    table = webread(this.API+this.PopulationData);

                otherwise
                    table = webread(this.API+this.HistoricalDatesOfRateChanges);
            end
            outputTable = struct2table(table);
        end

        function ts = getTimeSeries(timeSeriesCode,startDate,endDate,url,this)
            % gets time series data and output as table
            %
            % PROPERTIES:
            % this: an instance of the ResBankEconData class.
            % timeSeriesCode: code for the time series to retrieve data for.
            % startDate: start date for the time series, in the format 'yyyy-MM-dd'.
            % endDate: end date for the time series, in the format 'yyyy-MM-dd'.
            % url: URL to retrieve data from. The default URL is 'WebIndicators/Shared/GetTimeseriesObservations/'

            arguments
                timeSeriesCode string
                startDate string
                endDate string
                url string = "WebIndicators/Shared/GetTimeseriesObservations/"
                this = ResBankEconData
            end

            % Construct the full URL to retrieve data from.
            urlFull = this.API + url + timeSeriesCode + "/" + startDate + "/" + endDate;

            % Retrieve the data from the full URL and convert it to a table
            ts = webread(urlFull);
            ts = struct2table(ts);
        end

        function sectData = sectionData(code,url, this)
            % Gets specified data from selected statistics release table

            arguments
                code char = ""
                url string = "WebIndicators/ReleaseOfSelectedData/MonthlyIndicatorsAll/"
                this = ResBankEconData
            end

            % fetch the SelectedData table
            availableCodes = this.retrieveData("ReleaseOfSelectedData");
            % Extract the valid data types from the available data types.
            validCodes = availableCodes.DataType;

            if (code == "")
                % Display the available data types to the user.
                disp(availableCodes)
                % Prompt the user to input a data type.
                code = input("Input a DataType from the table: ","s");
            end
            code = upper(string(code));

            % Check if the input is a valid data type.
            checkValidity = ismember(code,validCodes);

            % If the input is not valid, prompt the user to input a valid data type.
            while checkValidity == false
                fprintf("Error: Invalid DataType. \n\n")
                code = input("Please input a valid DataType: ","s");
                code = upper(string(code));
                checkValidity = ismember(code,validCodes);
            end

            % Construct the full URL to retrieve data from.
            urlFull = this.API + url + code;
            % Retrieve the data from the full URL and convert it to a table.
            sectData = webread(urlFull);
            sectData = struct2table(sectData);

            % Remove Duplicates from the retrieved tables
            [~,idx,~] = unique(sectData(:,3),'stable');
            sectData = sectData(idx,:);
        end
    end
end