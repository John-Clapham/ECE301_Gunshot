% recorder3 = audiorecorder(44100,16,1,1);
% 
% disp('Start Speaking.')
% recordblocking(recorder3, 30);
% disp('end recording');

% %play(recObj);
% 
% mic3 = getaudiodata(recorder3);

%load mic_3_test_1.mat
% load mic_3_test_2.mat
% load Mic2Test2.mat
% load Mic1Test2_1Khz.mat
% figure
% subplot(3,1,1)
% plot(mic1)
% subplot(3,1,2)
% plot(microphone2)
% subplot(3,1,3)
% plot(mic3)

%info = audiodevinfo; 

% mic_1 = mic1';
% new_mic1 = [zeros(1,87760),mic_1];
% figure
% subplot(3,1,1)
% plot(new_mic1'),grid
% subplot(3,1,2)
% plot(microphone2),grid
% mic_3 = mic3';
% new_mic3 = [zeros(1,80200),mic_3];
% subplot(3,1,3)
% plot(new_mic3),grid

%164340 - 164440
%252100 - 252200
%171900 - 172000
fs = 44100;
tsample = 1/fs;
load Mic1Test4.mat
load Mic2Test4.mat
load Mic3_test4.mat
load Mic4Test4.mat
% n = numel(mic1);
% n2 = length(mic1);
% m =(n-1)*tsample;
% t = 0 : tsample : (m);
% figure
% subplot(4,1,1)
% plot(t,mic4)
% subplot(4,1,2)
% plot(t,mic1)
% subplot(4,1,3)
% plot(t,microphone2)
% subplot(4,1,4)
% plot(t,mic3)
 
mic_4 = mic4';
mic_1 = mic1';
mic_2 = microphone2';

new_mic4 = [zeros(1,22300) , mic_4];
new_mic1 = [zeros(1,75900) , mic_1];
new_mic2 = [zeros(1,19700) , mic_2];

% figure
% subplot(4,1,1)
% plot(new_mic4')
% subplot(4,1,2)
% plot(new_mic1')
% subplot(4,1,3)
% plot(new_mic2')
% subplot(4,1,4)
% plot(mic3)
 
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
plot(t2,aligned_mic4'),grid
subplot(4,1,2)
plot(t2,aligned_mic1'),grid
subplot(4,1,3)
plot(t2,aligned_mic2'),grid
subplot(4,1,4)
plot(t2,aligned_mic3'),grid,xlabel("Time(s)")

