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
            'u1gc'          %77
            'u2gc'          %78
            'u3gc'          %79
            'u4gc'          %80
            'u5gc'          %81
            'u6gc'          %82
            'u7gc'          %83
            'u8gc'          %84
            'u9gc'          %85
            'u10gc'         %86
            'u11gc'         %87
            'u12gc'         %88
            'u13gc'         %89
            'u14gc'         %90
            'u15gc'         %91
            'u16gc'         %92
            'u17gc'         %93
            'u18gc'         %94
            'u19gc'         %95
            'u20gc'         %96
            'u21gc'         %97
            'u22gc'         %98
            'u23gc'         %99
            'u24gc'         %100
            'u25gc'         %101
            'u26gc'         %102
            'u27gc'         %103
            'u28gc'         %104
            'u29gc'         %105
            'u30gc'         %106
            'u31gc'         %107
            'u32gc'         %108
            'u33gc'         %109
            'u34gc'         %110
            'u35gc'         %111
            'u36gc'         %112
            'u37gc'         %113
            'u38gc'         %114
            'u39gc'         %115
            'u40gc'         %116
            'u41gc'         %117
            'u42gc'         %118
            'u43gc'         %119
            'u1zsum'        %120
            'u2zsum'        %121
            'u3zsum'        %122
            'u4zsum'        %123
            'u5zsum'        %124
            'u6zsum'        %125
            'u7zsum'        %126
            'u8zsum'        %127
            'u9zsum'        %128
            'u10zsum'       %129
            'u11zsum'       %130
            'u12zsum'       %131
            'u13zsum'       %132
            'u14zsum'       %133
            'u15zsum'       %134
            'u16zsum'       %135
            'u17zsum'       %136
            'u18zsum'       %137
            'u19zsum'       %138
            'u20zsum'       %139
            'u21zsum'       %140
            'u22zsum'       %141
            'u23zsum'       %142
            'u24zsum'       %143
            'u25zsum'       %144
            'u26zsum'       %145
            'u27zsum'       %146
            'u28zsum'       %147
            'u29zsum'       %148
            'u30zsum'       %149
            'u31zsum'       %150
            'u32zsum'       %151
            'u33zsum'       %152
            'u34zsum'       %153
            'u35zsum'       %154
            'u36zsum'       %155
            'u37zsum'       %156
            'u38zsum'       %157
            'u39zsum'       %158
            'u40zsum'       %159
            'u41zsum'       %160
            'u42zsum'       %161
            'u43zsum'       %162
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
            'Aggregate real wage'                                               %20 <<< 19 missing
            'Aggregate labor'                                                   %21
            'Labor tax rate'                                                    %22
            'Domestic consumption goods inflation'                              %24 <<< 23 missing
            'Real wage chosen by unions who update prices'                      %25
            'Output'                                                            %26
            'Monetary policy disturbance'                                       %27
            'Non-savers consumption'                                            %28
            'Non-savers transfers'                                              %29
            'Domestically produced consumption goods'                           %30
            'Domestically produced investment goods'                            %31
            'Domestically produced government consumption goods'                %32
            'Government debt'                                                   %33
            'Government consumption'                                            %34
            'Government consumption goods price'                                %35
            'Aggregate consumtpion'                                             %36
            'Savers transfers'                                                  %37
            'Government consumption shock process'                              %38
            'Capital tax shock process'                                         %39
            'Labor tax shock process'                                           %40
            'Consumption tax shock process'                                     %41
            'Transfer shock process'                                            %42
            'Transfers'                                                         %43
            'Real exchange rate'                                                %44
            'Foreign asset position'                                            %45
            'Aggregate home imports'                                            %46
            'Import price'                                                      %47
            'Imported consumption goods'                                        %48
            'Imported investment goods'                                         %49
            'Imported government consumption goods'                             %50
            'Terms of trade'                                                    %51
            'Nominal exchange rate'                                             %52
            'After tax real wage rate'                                          %53
            'Captial tax revenue'                                               %54
            'Labor tax revenue'                                                 %55
            'Consumption tax revenue'                                           %56
            'Technology shock process'                                          %57
            'Debt to GDP ratio'                                                 %58
            'Foreign nominal interest rate'                                     %59
            'World GDP'                                                         %60
            'Row inflation'                                                     %61
            'Exported goods inflation'                                          %62
            'Exports'                                                           %63
            'Exported goods price'                                              %64
            'lambdas(t+1)'                                                      %65
            'piC(t+1)'                                                          %66
            'i(t+1)'                                                            %67
            'q(t+1)'                                                            %68
            'rk(t+1)'                                                           %69
            'tauk(t+1)'                                                         %70
            'piH(t+1)'                                                          %71
            'w(t+1)'                                                            %72
            'piHstar(t+1)'                                                      %73
            's(t+1)'                                                            %74
            'piCstar(t+1)'                                                      %75
            'Primary deficit'                                                   %76
            'Import goods inflation'                                            %77
            'piF(t+1)'                                                          %78 % this is 76
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