% ImportData_0fC = Importdata();
prompt_asic = 'Please Input the ASIC ID';
dlg_title_asic = 'ASIC ID';
answer = inputdlg(prompt_asic, dlg_title_asic);
ASIC_ID = str2double(answer);
prompt_num = {'Input the number of the data'};
dlg_title_num = 'Number of data';
answer = inputdlg(prompt_num,dlg_title_num);
Data_Number = str2double(answer);
DAC0_50Percent = zeros(1,64);
DAC1_50Percent = zeros(1,64);
DAC2_50Percent = zeros(1,64);
Channel = 1:1:64;
mean_DAC0 = 1:1:Data_Number;
mean_DAC1 = 1:1:Data_Number;
mean_DAC2 = 1:1:Data_Number;
Legend_str = cell(Data_Number,1);
Channel0_DAC = 1:1:Data_Number;
Channel1_DAC = 1:1:Data_Number;
Channel2_DAC = 1:1:Data_Number;
DeltaV0 = 1:1:Data_Number;
DeltaV1 = 1:1:Data_Number;
DeltaV2 = 1:1:Data_Number;
prompt_Charge = 'Input the charge and select the file';
dlg_title_Charge = 'Charge';
Charge = 1:1:Data_Number;
for i = 1:1:Data_Number
    Charge_answer = inputdlg(prompt_Charge, dlg_title_Charge);
    Charge(i) = str2double(Charge_answer);
    ImportData = Importdata();
    for j = 0:1:63
        [DAC0_50Percent(j+1), DAC1_50Percent(j+1), DAC2_50Percent(j+1)] = SingleChannelTrigEfficiency(ImportData, j);
    end
    str_tmp = sprintf('%d fC',Charge(i));
    Legend_str{i} = str_tmp;
%     mean_DAC0(i) = mean(DAC0_50Percent);
    Channel0_DAC(i) = DAC0_50Percent(1);
    Channel1_DAC(i) = DAC1_50Percent(1);
    Channel2_DAC(i) = DAC2_50Percent(1);
    DeltaV0(i) = 2.43*(Channel0_DAC(1) - Channel0_DAC(i));
    DeltaV1(i) = 2.43*(Channel1_DAC(1) - Channel1_DAC(i));
    DeltaV2(i) = 2.43*(Channel2_DAC(1) - Channel2_DAC(i));
    figure(1);
    stairs(Channel,DAC0_50Percent);
    hold on;
    figure(2);
    stairs(Channel,DAC1_50Percent);
    hold on;
    figure(3);
    stairs(Channel,DAC2_50Percent);
    hold on;
end
figure(1)
h = legend(Legend_str);
set(h,'Location','eastout');
xlabel('\bf Channel Number');
ylabel('\bf DAC Code')
title1_str = sprintf('Trig0:50%% Trig efficiency with different charge input--ASIC Number:%d',ASIC_ID);
title(title1_str);
hold off
figure(2)
h = legend(Legend_str);
set(h,'Location','eastout');
xlabel('\bf Channel Number');
ylabel('\bf DAC Code')
title1_str = sprintf('Trig1:50%% Trig efficiency with different charge input--ASIC Number:%d',ASIC_ID);
title(title1_str);
hold off
figure(3)
h = legend(Legend_str);
set(h,'Location','eastout');
xlabel('\bf Channel Number');
ylabel('\bf DAC Code')
title1_str = sprintf('Trig2:50%% Trig efficiency with different charge input--ASIC Number:%d',ASIC_ID);
title(title1_str);
hold off

% DAC0
DAC0_Fit = Channel0_DAC(1:8);
DAC0_Charge_Fit = Charge(1:8);
Rp0 = corrcoef(DAC0_Charge_Fit, DAC0_Fit);
R0 = Rp0(2,1);
x0 = linspace(min(DAC0_Charge_Fit),max(DAC0_Charge_Fit));
p0 = polyfit(DAC0_Charge_Fit,DAC0_Fit,1);
y0 = polyval(p0,x0);
figure(4)
plot(Charge,Channel0_DAC,'r*');
y0_LinearFit = p0(1)*DAC0_Charge_Fit + p0(2);
DNL0 = (DAC0_Fit - y0_LinearFit)/y0_LinearFit(1);
Max_DNL0 = max(DNL0);
linear_legend_str = sprintf('DAC0:Linear fit of shaper output,MAX DNL:%2.3f%% -- ASIC ID��%d \n slope:%1.4f (Code/Charge)',Max_DNL0*100, ASIC_ID,p0(1));
xlabel('Charge(fC)');
h0 = ylabel('DAC Code');
set(h0,'Interpreter','tex');
hold on
plot(x0,y0)
h0 = legend('Shaper0 output',linear_legend_str);
set(h0,'Location','northeast');
% DAC1
DAC1_Fit = Channel1_DAC(1:8);
DAC1_Charge_Fit = Charge(1:8);
Rp1 = corrcoef(DAC1_Charge_Fit, DAC1_Fit);
R1 = Rp1(2,1);
x1 = linspace(min(DAC1_Charge_Fit),max(DAC1_Charge_Fit));
p1 = polyfit(DAC1_Charge_Fit,DAC1_Fit,1);
y1 = polyval(p1,x1);
figure(5)
plot(Charge,Channel1_DAC,'r*');
y1_LinearFit = p1(1)*DAC1_Charge_Fit + p1(2);
DNL1 = (DAC1_Fit - y1_LinearFit)/y1_LinearFit(1);
Max_DNL1 = max(DNL1);
linear_legend_str = sprintf('DAC1:Linear fit of shaper output,MAX DNL: %2.3f%% -- ASIC ID��%d \n slope:%1.4f (Code/Charge)',Max_DNL1*100, ASIC_ID,p1(1));
xlabel('Charge(fC)');
h1 = ylabel('DAC Code');
set(h1,'Interpreter','tex');
hold on
plot(x1,y1)
h1 = legend('Shaper1 output',linear_legend_str);
set(h1,'Location','northeast');
% DAC2
DAC2_Fit = Channel2_DAC;
DAC2_Charge_Fit = Charge;
Rp2 = corrcoef(DAC2_Charge_Fit, DAC2_Fit);
R2 = Rp2(2,1);
x2 = linspace(min(DAC2_Charge_Fit),max(DAC2_Charge_Fit));
p2 = polyfit(Charge,Channel2_DAC,1);
y2 = polyval(p2,x2);
figure(6)
plot(DAC2_Charge_Fit,DAC2_Fit,'r*');
y2_LinearFit = p2(1)*DAC2_Charge_Fit + p2(2);
DNL2 = (DAC2_Fit - y2_LinearFit)/y2_LinearFit(1);
Max_DNL2 = max(DNL2);
linear_legend_str = sprintf('DAC2:Linear fit of shaper output,Max DNL:%2.3f %%-- ASIC ID��%d \n slope:%1.4f (Code/Charge)',Max_DNL2*100, ASIC_ID,p2(1));
xlabel('Charge(fC)');
h2 = ylabel('DAC Code');
% set(h2,'Interpreter','tex');
hold on
plot(x2,y2)
h2 = legend('Shaper2 output',linear_legend_str);
set(h2,'Location','northeast');