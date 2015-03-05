%% Inicializacion
clc
clear all
close all

%% Constantes
Fs=44100;
FileIn='bb.wav';
FileOut='rbb.wav';

%% Carga, conversion y salvado de ficheros
[bb, rbb] = load_resample(FileIn, Fs);
wavwrite(rbb*0.9, Fs, FileOut);

%% Eje de tiempos
tFin = length(rbb)/Fs;
t = [0:1/Fs:tFin-1/Fs];

%% Generacion de la portadora
Fm = 5e3;
p = cos(2*pi*Fm*t)';
psin = sin(2*pi*Fm*t)';


%% Dibuja juntos portadora y moduladora
% En el tiempo
plot(p)
hold on
plot(rbb, 'r');

% Y en la frecuencia
figure
plotFFT(p, Fs);
hold on
plotFFT(rbb, Fs, 'r');

%% Realizamos las modulaciones
%% DBL
dbl = p.*rbb;
figure
plot(dbl);
figure
plotFFT(dbl, Fs);

wavwrite(dbl*0.9, Fs, 'dbl.wav');

%% AM
im = 0.9;
am = p.*(rbb+im);
figure
plot(am);
figure
plotFFT(am, Fs);

wavwrite(am*0.9, Fs, 'am.wav');

%% SSB
%% USB
usb = p.*rbb - psin.*imag(hilbert(rbb));
figure
plot(abs(usb))

figure
plotFFT(usb, Fs);

wavwrite(usb*0.9, Fs, 'usb.wav');

%% LSB
lsb = p.*rbb + psin.*imag(hilbert(rbb));
figure
plot(abs(lsb))

figure
plotFFT(lsb, Fs);

wavwrite(lsb*0.9, Fs, 'lsb.wav');
