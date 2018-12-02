% recorder1 = audiorecorder(44100,16,1,0);
% disp('Start speaking.')
% recordblocking(recorder1, 30)
% disp('End of Recording.')
% 
% mic1 = getaudiodata(recorder1);
load Mic1Test4.mat
load Mic2Test4.mat
load Mic3Test4.mat
load Mic4Test4.mat

figure
plot(mic1);
xlabel('Samples')
ylabel('Amplitude')
title('Microphone1 Test4')
figure
plot(mic2);
xlabel('Samples')
ylabel('Amplitude')
title('Microphone2 Test4')
figure
plot(mic3);
xlabel('Samples')
ylabel('Amplitude')
title('Microphone3 Test4')
figure
plot(mic4); 
xlabel('Samples')
ylabel('Amplitude')
title('Microphone4 Test4')
% play(recorder1)
%soundsc(mic1);
