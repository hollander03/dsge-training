%% retime series
%clear
%m4div = (1:636)';
%data=(0:638)';
%t1 = datetime(1967,1,1);
%t2 = t1 + calmonths(0:637)';
%TT = array2timetable(data,'RowTimes',t2);
%dataq = retime(TT,'quarterly','mean');
%% OR
%t1 = datetime(1967,1,31);
%t2 = datetime(2019,12,31);
%t = t1:calmonths(1):t2;
%t=t';
%% OR USE THIS ONE
%clear
%m4div = (1:636)';
t2 = datetime(1967,1,31) + calmonths(0:635);
t2=t2';
TT=timetable(t2,m4div);
TTQ=retime(TT,'quarterly','mean');
%% Shadow rate monthly to quarterly
%clear
%y = (1:364)';
y = exph13trte;
t2 = datetime(1990,1,31) + calmonths(0:363);
t2=t2';
TT=timetable(t2,y);
TTQ=retime(TT,'quarterly','mean');

%% Extract to table format
TTQarray = timetable2table(TTQ);
y = TTQarray(:,2);
stackedplot(y)
%%
% To define time, use the following command: 
% time = start_date:frequency:end_date;
%where frequency is equal to 0.25 for quarterly data and 1 for annual data. For instance
%time = 1947:0.25:2010.75;
% yields a time line from the first quarter 1947 to the fourth quarter in 2010.

%% Often data needs to be imported from Excel using xlsread:
%[numerical_data text_data]=xlsread('C:nSomeFoldernDatafile.xlsx','Name of the Excel Sheet','A1:X10');

%[Grates]=xlsread('C:/Users/hylton/Google Drive/Collaboration - National Treasury/Data/GovBondYieldData.xlsx','Grates','A418:F729');
[Grates]=xlsread('C:/Users/hylton/Google Drive/Collaboration - National Treasury/Data/GovBondYieldData.xlsx','A418:H741');