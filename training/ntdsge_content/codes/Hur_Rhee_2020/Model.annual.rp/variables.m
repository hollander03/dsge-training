function V = variables

% Variables: Names variables and assigns locations
% Inputs:
%     [None]
% Output:
%     V     :   Structure of variable locations and names

% Variables names
V.names = { 'lambdas'       % 1 Lagragian multiplier for savers budget constraint
            'ub'            % 2 Preference shock process
            'tauc'          % 3 Consumption tax rate
            'cs'            % 4 Savers consumption
            'r'             % 5 Real interest rate
            'R'             % 6 Nominal interest rate
            'i'             % 7 Investment
            'ui'            % 8 Investment shock process
            'q'             % 9 Lagragian multiplier for a unit of investment goods	(Tobin's Q)
            'pI'            %10 Relative price of home investment w.r.t. home consumption basket
            'kbar'          %11 Private capital
            'k'             %12 Effective private capital
            'u'             %13 Capital utilization rate
            'rk'            %14 Real return for private capital
            'tauk'          %15 Capital tax rate
            'piH'           %16 Domestic goods inflation
            'mc'            %17 Real marginal cost
            'pH'            %18 Domestic goods price
            'w'             %19 Aggregate real wage
            'l'             %20 Aggregate labor
            'taul'          %21 Labor tax rate
            'piC'           %22 Domestic consumption goods inflation
            'wtilde'        %23 Real wage chosen by unions who update prices
            'y'             %24 Output
            'um'            %25 Monetary policy disturbance
            'cn'            %26 Non-savers consumption
            'zn'            %27 Non-savers transfers
            'cH'            %28 Domestically produced consumption goods
            'iH'            %29 Domestically produced investment goods
            'gH'            %30 Domestically produced government consumption goods
            'b'             %31 Government debt
            'gc'            %32 Government consumption
            'pG'            %33 Government consumption goods price
            'c'             %34 Aggregate consumtpion
            'zs'            %35 Savers transfers
            'ugc'           %36 Government consumption shock process
            'utk'           %37 Capital tax shock process
            'utl'           %38 Labor tax shock process
            'utc'           %39 Consumption tax shock process
            'uzsum'         %40 Transfer shock process
            'zsum'          %41 Transfers
            's'             %42 Real exchange rate
            'z'             %43 Foreign asset position
            'im'            %44 Aggregate home imports
            'pF'            %45 Import price
            'cF'            %46 Imported consumption goods
            'iF'            %47 Imported investment goods
            'gF'            %48 Imported government consumption goods
            'TOT'           %49 Terms of trade
            'S'             %50 Nominal exchange rate
            'atlw'          %51 After tax real wage rate
            'Tk'            %52 Captial tax revenue
            'Tl'            %53 Labor tax revenue
            'Tc'            %54 Consumption tax revenue
            'ua'            %55 Technology shock process
            'sb'            %56 Debt to GDP ratio
            'Rstar'         %57 Foreign nominal interest rate
            'ystar'         %58 World GDP
            'piCstar'       %59 Row inflation
            'piHstar'       %60 Exported goods inflation
            'ex'            %61 Exports
            'pHstar'        %62 Exported goods price
            'xlambdas'      %63 lambdas(t+1)
            'xpiC'          %64 piC(t+1)
            'xi'            %65 i(t+1)
            'xq'            %66 q(t+1)
            'xrk'           %67 rk(t+1)
            'xtauk'         %68 tauk(t+1)
            'xpiH'          %69 piH(t+1)
            'xw'            %70 w(t+1)
            'xpiHstar'      %71 piHstar(t+1)
            'xs'            %72 s(t+1)
            'xpiCstar'      %73 piCstar(t+1)
            'def'           %74 Primary deficit
            'piF'           %75 Import goods inflation
            'xpiF'          %76 piF(t+1)
            'urp'           %77 risk premium shock process % <<< 180309
            'nx'            %78 net exports % <<< 181215

          };
      
% Variables titles
V.desc = {  'Lagragian multiplier for savers budget constraint'                 % 1
            'Preference shock process'                                          % 2
            'Consumption tax rate'                                              % 3
            'Savers consumption'                                                % 4
            'Real interest rate'                                                % 5
            'Nominal interest rate'                                             % 6
            'Investment'                                                        % 7
            'Investment shock process'                                          % 8
            'Lagragian multiplier for a unit of investment goods (Tobins Q)'    % 9
            'Relative price of home investment w.r.t. home consumption basket'  %10
            'Private capital'                                                   %11
            'Effective private capital'                                         %12
            'Capital utilization rate'                                          %13
            'Real return for private capital'                                   %14
            'Capital tax rate'                                                  %15
            'Domestic goods inflation'                                          %16
            'Real marginal cost'                                                %17
            'Domestic goods price'                                              %18
            'Aggregate real wage'                                               %19
            'Aggregate labor'                                                   %20
            'Labor tax rate'                                                    %21
            'Domestic consumption goods inflation'                              %22
            'Real wage chosen by unions who update prices'                      %23
            'Output'                                                            %24
            'Monetary policy disturbance'                                       %25
            'Non-savers consumption'                                            %26
            'Non-savers transfers'                                              %27
            'Domestically produced consumption goods'                           %28
            'Domestically produced investment goods'                            %29
            'Domestically produced government consumption goods'                %30
            'Government debt'                                                   %31
            'Government consumption'                                            %32
            'Government consumption goods price'                                %33
            'Aggregate consumtpion'                                             %34
            'Savers transfers'                                                  %35
            'Government consumption shock process'                              %36
            'Capital tax shock process'                                         %37
            'Labor tax shock process'                                           %38
            'Consumption tax shock process'                                     %39
            'Transfer shock process'                                            %40
            'Transfers'                                                         %41
            'Real exchange rate'                                                %42
            'Foreign asset position'                                            %43
            'Aggregate home imports'                                            %44
            'Import price'                                                      %45
            'Imported consumption goods'                                        %46
            'Imported investment goods'                                         %47
            'Imported government consumption goods'                             %48
            'Terms of trade'                                                    %49
            'Nominal exchange rate'                                             %50
            'After tax real wage rate'                                          %51
            'Captial tax revenue'                                               %52
            'Labor tax revenue'                                                 %53
            'Consumption tax revenue'                                           %54
            'Technology shock process'                                          %55
            'Debt to GDP ratio'                                                 %56
            'Foreign nominal interest rate'                                     %57
            'World GDP'                                                         %58
            'Row inflation'                                                     %59
            'Exported goods inflation'                                          %60
            'Exports'                                                           %61
            'Exported goods price'                                              %62
            'lambdas(t+1)'                                                      %63
            'piC(t+1)'                                                          %64
            'i(t+1)'                                                            %65
            'q(t+1)'                                                            %66
            'rk(t+1)'                                                           %67
            'tauk(t+1)'                                                         %68
            'piH(t+1)'                                                          %69
            'w(t+1)'                                                            %70
            'piHstar(t+1)'                                                      %71
            's(t+1)'                                                            %72
            'piCstar(t+1)'                                                      %73
            'Primary deficit'                                                   %74
            'Import goods inflation'                                            %75
            'piF(t+1)'                                                          %76
            'risk premium shock process'                                        %77 % <<< 180309
            'Net exports'                                                       %78 % <<< 181215

         };
     
% Shocktypes: 
V.shocktypes = {'ua','um','ub','ui','ugc','utk','utl','utc','uzsum',...
                'ystar','piCstar','Rstar','urp'}; % <<< 180309
% Forecast errors
V.foretypes = {'lambdas','piC','i','q','rk','tauk','piH','w','piHstar','s','piCstar','piF'};
             
% Number of variables
V.nvar = length(V.names);
% Number of shocks
V.nshock = length(V.shocktypes);
% Number of forecast errors
V.nfore = length(V.foretypes);

% Establish variable index
for j = 1:size(V.names,1)
   eval(['V.' V.names{j} ' = j;']);      
end
% Establish shock index
for j = 1:V.nshock
    eval(['V.eps' V.shocktypes{j} ' = j;'])
end
% Establish forecast error index
for j = 1:V.nfore
    eval(['V.fe' V.foretypes{j} ' = j;'])
end