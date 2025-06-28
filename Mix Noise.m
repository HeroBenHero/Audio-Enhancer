clear all
close all
clc
[y,fs]=audioread('Clean.mp3');
[x,fs]=audioread('Noise.wav');
x(52993:72000)=[]
length(x)
z=x+y
audiowrite('Test.wav',z,fs)
