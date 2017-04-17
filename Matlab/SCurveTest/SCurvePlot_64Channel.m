%% 64 Channel SCurvePlot
prompt = 'Please Input the ASIC ID';
dlg_title = 'ASIC ID';
answer = inputdlg(prompt, dlg_title);
ASIC_ID = str2double(answer);
InitialData = Importdata();
legend_str = cell(8,8);
DAC0_50percent = 1:1:64;
DAC1_50percent = 1:1:64;
DAC2_50percent = 1:1:64;
for i=0:1:63
    [DAC0_50percent(i+1), DAC1_50percent(i+1), DAC2_50percent(i+1)] = SCurvePlotSingleChannel(InitialData, i ,0);
    %legend_str{i+1} = sprintf('Channel%d',i+1);    
end
Channel_Number = 1:1:64;
figure(4)
Channel_Number(61) = [];
DAC0_50percent(61) = [];
stairs(Channel_Number, DAC0_50percent);
xlabel('\bf Channel');
ylabel('\bf DAC Code of 50% Trig Efficiency');
title4_str = sprintf('50%% Trig Efficiency of DAC0 -- ASIC ID:%d',ASIC_ID);
title(title4_str);
figure(5)
DAC1_50percent(61) = [];
stairs(Channel_Number, DAC1_50percent);
xlabel('\bf Channel');
ylabel('\bf DAC Code of 50% Trig Efficiency');
title5_str = sprintf('50%% Trig Efficiency of DAC1 -- ASIC ID:%d',ASIC_ID);
title(title5_str);
figure(6)
DAC2_50percent(61) = [];
stairs(Channel_Number, DAC2_50percent);
xlabel('\bf Channel');
ylabel('\bf DAC Code of 50% Trig Efficiency');
title6_str = sprintf('50%% Trig Efficiency of DAC1 -- ASIC ID:%d',ASIC_ID);
title(title6_str);
% legend_str = {'Channel1','Channel2'};
figure(1)
%legend(legend_str{1});
xlabel('\bf DAC Code');
ylabel('\bfTrig Efficiency');
title_str0 = sprintf('S Curve of DAC0 -- ASIC ID:%d',ASIC_ID);
title(title_str0);
axis([0 1023,-10 110]);
hold off;
figure(2)
xlabel('\bf DAC Code');
ylabel('\bfTrig Efficiency');
title_str1 = sprintf('S Curve of DAC1 -- ASIC ID:%d',ASIC_ID);
title(title_str1);
axis([0 1023,-10 110]);
hold off;
figure(3)
xlabel('\bf DAC Code');
ylabel('\bfTrig Efficiency');
title_str2 = sprintf('S Curve of DAC2 -- ASIC ID:%d',ASIC_ID);
title(title_str2);
axis([0 1023,-10 110]);
hold off;