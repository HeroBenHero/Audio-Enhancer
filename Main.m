% Noise Generation Low Freq
clear all
close all
clc

fl = 600;
[x, fs] = audioread('Clean.mp3');
n = length(x); 
t = (1:n)/fs;
z = cos(2*pi*fl*t)';

sound(z, fs)
audiowrite('Noise.wav', z, fs);

% Audio Mixing
close all
clc

[x, fs] = audioread('Clean.mp3');
[z, fs] = audioread('Noise.wav');

y = x + z;

audiowrite('Test.wav', y, fs)

sound(x, fs)
sound(y, fs)

% Filter Design High Pass
close all
clc

[z, fs] = audioread('Test.wav');

y = highpass(z, fl+150, fs);

[x, fs] = audioread('Clean.mp3');

sound(x, fs)
sound(y, fs)

audiowrite('Output.wav', y, fs);

% Audio Amplifier
[x, fs] = audioread('Clean.wav');
[y, Fs] = audioread('Output.wav');
[z, fs] = audioread('Test.wav');

y = y * 10;

sound(x, Fs)
sound(z, Fs)
sound(y, Fs)

audiowrite('Output.wav', y, fs);

% Plot And Response
[x, fs] = audioread('Clean.wav');
[y, Fs] = audioread('Output.wav');
[z, fs] = audioread('Test.wav');

subplot(3,2,1)
plotWave_YW(0, x, fs, 'time', 1);
title('Clean speech')
subplot(3,2,2)
plotWave_YW(0, x, fs, 'freq');

subplot(3,2,3)
plotWave_YW(0, z, fs, 'time', 1);
title('Noisy speech')
subplot(3,2,4)
plotWave_YW(0, y, fs, 'freq');

subplot(3,2,5)
plotWave_YW(0, y, fs, 'time', 1);
title('Enhanced speech')
subplot(3,2,6)
plotWave_YW(0, z, fs, 'freq');

% Gaussian Noise
clear all
close all
clc

fh = 10000;
[x, fs] = audioread('Clean.mp3');

xn = awgn(x, 20, 'measured');

sound(xn, fs)
audiowrite('Noise.wav', xn, fs);

% Wiener Filter
close all
clc

[x, fs] = audioread('Clean.wav');
[z, ~] = audioread('Noise.wav');
y = noiseReduction_YW(z, fs);

audiowrite('Output.wav', y, fs);

% Audio Amplifier
[x, fs] = audioread('Clean.wav');
[y, Fs] = audioread('Output.wav');
[z, fs] = audioread('Noise.wav');

y = y * 10;

sound(x, Fs)
sound(y, Fs)
sound(z, Fs)

audiowrite('Noise.wav', y, fs);

% Plot And Response
[x, fs] = audioread('Clean.wav');
[y, Fs] = audioread('Output.wav');
[z, fs] = audioread('Noise.wav');

subplot(3,2,1)
plotWave_YW(0, x, fs, 'time', 1);
title('Clean speech')
subplot(3,2,2)
plotWave_YW(0, x, fs, 'freq');

subplot(3,2,3)
plotWave_YW(0, z, fs, 'time', 1);
title('Noisy speech')
subplot(3,2,4)
plotWave_YW(0, z, fs, 'freq');

subplot(3,2,5)
plotWave_YW(0, y, fs, 'time', 1);
title('Enhanced speech')
subplot(3,2,6)
plotWave_YW(0, y, fs, 'freq');