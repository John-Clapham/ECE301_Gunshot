%Data Alignment
fs = 44100;
tsample = 1/fs;
load Mic1Test4.mat
load Mic2Test4.mat
load Mic3_test4.mat
load Mic4Test4.mat
 
mic_4 = mic4';
mic_1 = mic1';
mic_2 = microphone2';

new_mic4 = [zeros(1,22300) , mic_4];
new_mic1 = [zeros(1,75900) , mic_1];
new_mic2 = [zeros(1,19700) , mic_2];
 
new_mic3 = mic3';
 
aligned_mic1 = new_mic1(217500:end);
aligned_mic2 = [new_mic2(217500:end),zeros(1,56200)];
aligned_mic3 = [new_mic3(217500:end),zeros(1,75900)];
aligned_mic4 = [new_mic4(217500:end),zeros(1,53600)];
 
n2 = numel(aligned_mic1);
m = (n2-1)*tsample;
t2 = 0:tsample:m;

figure
subplot(4,1,1)
plot(t2,aligned_mic4'),grid,title("Mic 4")
subplot(4,1,2)
plot(t2,aligned_mic1'),grid,title("Mic 1"),ylabel("Amplitude")
subplot(4,1,3)
plot(t2,aligned_mic2'),grid,title("Mic 2")
subplot(4,1,4)
plot(t2,aligned_mic3'),grid,xlabel("Time(s)"),title("Mic 3")

% Observed times of arrival from the signals
Mic1AT = 13.894;
Mic2AT = 13.889;
Mic3AT = 13.883;
Mic4AT = 13.869;

% Difference in time from each mic to the reference mic, Microphone 4
dT1 = Mic1AT-Mic4AT;
dT2 = Mic2AT-Mic4AT;
dT3 = Mic3AT-Mic4AT;

% Distance calculated from each Mic to the reference mic, in feet using
% 1125.33 f/s
D1 = dT1*1125.33;
D2 = dT2*1125.33;
D3 = dT2*1125.33;

%Gunshot Location
xloc = [0 0 15 10]; %x positions of comp
yloc = [0 25 25 15]; %y positions of comp

Sx = 10; %known location of source.. wont know this for project
Sy = 15;


th = 0:pi/100:2*pi; %the step size determines how close the circles are to the radi

xunit1 = D1 * cos(th) + xloc(1); %circle around mic 1
yunit1 = D1 * sin(th) + yloc(1);

xunit2 = D2 * cos(th) + xloc(2); %circle around mic 2
yunit2 = D2 * sin(th) + yloc(2);

xunit3 = D3 * cos(th) + xloc(3); %circle around mic 3
yunit3 = D3 * sin(th) + yloc(3);


%Find the intersection of three spheres                 
%P1,P2,P3 are the centers, D1,D2,D3 are the radii       
%Implementaton based on Wikipedia Trilateration.  
P1 = [0,0];
P2 = [0,25];
P3 = [15,25];
            
temp1 = P2-P1;
e_x = temp1/norm(temp1);
temp2 = P3-P1;
i = dot(e_x,temp2);
temp3 = temp2 - i*e_x;
e_y = temp3/norm(temp3);                                
d = norm(P2-P1);
j = dot(e_y,temp2);
x = (D1*D1 - D2*D2 + d*d) / (2*d);
y = (D1*D1 - D3*D3 -2*i*x + i*i + j*j) / (2*j);
temp4 = D1*D1 - x*x - y*y;
pa = P1 + x*e_x + y*e_y;

figure
%positions of mics
foo1 = scatter(xloc,yloc)
hold on
%positions of sound source
foo2 = scatter(Sx,Sy);

%circles with radi of distance from mic to source
hold on
plot(xunit1, yunit1);
hold on
plot(xunit2, yunit2);
hold on
plot(xunit3, yunit3);
hold on

%plot radi... just for visulaization
plot([xloc(1),xunit1(80)],[yloc(1),yunit1(80)]);
hold on
plot([xloc(2),xunit2(80)],[yloc(2),yunit2(80)]);
hold on
plot([xloc(3),xunit3(80)],[yloc(3),yunit3(80)]);  

%plot esmitated location
hold on
foo3 = scatter(pa(2),pa(1),'filled');

grid on
xlabel('x position (ft)')
ylabel('y position(ft)')
title('Location Estimation of Gunshot')
legend([foo1, foo2, foo3],{'Microphone Positions','Gunshot Position','Estimated Position'})
