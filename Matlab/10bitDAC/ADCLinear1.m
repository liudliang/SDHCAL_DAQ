minV = 0.8;
maxV = 3.0;
% Code = [0,127,255,383,511,693,767,895,1023];
% Vth0 = [0.8270,1.0995,1.3776,1.6670,1.9471,2.2253,2.4985,2.7355,2.7475];
% Vth1 = [0.8229,1.0931,1.3678,1.6441,1.9189,2.1919,2.4607,2.7199,2.7420];
% Vth2 = [0.8270,1.0995,1.3776,1.6533,1.9315,2.2039,2.4762,2.7365,2.7668];
Code = [0,127,255,383,511,639,767,895];
Vth0 = [0.8323,1.1070,1.3867,1.6706,1.9505,2.2235,2.4965,2.7287];
Vth1 = [0.8346,1.1099,1.3887,1.6702,1.9492,2.2285,2.4990,2.7275];
Vth2 = [0.8326,1.1082,1.3871,1.6693,1.9486,2.2268,2.4988,2.7432];

%%%%PolyFit
Rp0 = corrcoef(Code,Vth0);
Rp1 = corrcoef(Code,Vth1);
Rp2 = corrcoef(Code,Vth2);
R0 = Rp0(2,1);
R1 = Rp1(2,1);
R2 = Rp2(2,1);
x = linspace(min(Code),max(Code));
p0 = polyfit(Code,Vth0,1);
y0 = polyval(p0,x);
p1 = polyfit(Code,Vth1,1);
y1 = polyval(p1,x);
p2 = polyfit(Code,Vth2,1);
y2 = polyval(p2,x);
xText = (min(Code) + max(Code))/2;
yText = (maxV+ minV)/2.0;
DAC0_Fit = p0(1)*Code + p0(2);
DAC0_INL = (Vth0 - DAC0_Fit)/DAC0_Fit(8) * 100;
DAC0_INL_Max = max(abs(DAC0_INL));
figure(4);
plot(Code, DAC0_INL);
axis([0 Code(8),-5 5]);
DAC1_Fit = p1(1)*Code + p1(2);
DAC1_INL = (Vth1 - DAC1_Fit)/DAC1_Fit(8) * 100;
DAC1_INL_Max = max(abs(DAC1_INL));
figure(5);
plot(Code, DAC1_INL);
axis([0 Code(8),-5 5]);
DAC2_Fit = p2(1)*Code + p2(2);
DAC2_INL = (Vth2 - DAC2_Fit)/DAC2_Fit(8) * 100;
DAC2_INL_Max = max(abs(DAC2_INL));
figure(6);
plot(Code, DAC2_INL);
axis([0 Code(8),-5 5]);
str0 = sprintf('Vth_0 vs Code\n--Max INL %1.6f %%',DAC0_INL_Max);
str1 = sprintf('Vth_1 vs Code\n--Max INL %1.6f %%',DAC1_INL_Max);
str2 = sprintf('Vth_2 vs Code\n--Max INL %1.6f %%',DAC2_INL_Max);
figure(1);
plot(Code,Vth0,'o');
hold on;
plot(x,y0);
%text(xText,yText,str0);
legend(str0);

figure(2);
plot(Code,Vth1,'*');
hold on;
plot(x,y1);
%text(xText,yText,str1);
legend(str1);

figure(3);
plot(Code,Vth2,'x');
hold on;
plot(x,y2);
%text(xText,yText,str2);
legend(str2);

