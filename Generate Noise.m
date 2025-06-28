clear all
close all
clc

f=200;
fs=24000;
d=3;
n=fs*d;
t=(1:n)/fs;
y=cos(2*pi*f*t);

sound(y,fs);
audiowrite('Noise.wav',y,fs);
