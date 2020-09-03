%% Termistor beräkningar
clc, clear all, close all
T = linspace (173,323,150);
N0300=1.3e+17;
nN0=2.4;
Mikromin300=90;
nMikromin=-0.6;
Mikrolminusmin300=1260;
nMikrolminusmin=-2.33;
Alpha300=0.91;
nAlpha=-0.15;                       %Samtliga värden från tabell i Jeppson, parametrar vid 300K

N0=N0300.*(T./300).^nN0;
Mikromin=Mikromin300.*(T./300).^nMikromin;
Mikrolminusmin=Mikrolminusmin300.*(T./300).^nMikrolminusmin;
Alpha=Alpha300.*(T./300).^nAlpha;

N=3.3e13;      %Vår dopningskoncentration

Mikro=Mikromin + Mikrolminusmin./((1+(N./N0)).^Alpha);
figure(1)
plot(T,Mikro), ylabel('\mu(cm^2/Vs)'), xlabel('T(^oK)'), title ('Mobility as function of temperature'), grid on
%plottar mobiliteten som funktion av temperatur

Q=1.602e-19;
Sigma=Mikro.*Q.*N;
figure(2)
plot(T,Sigma), xlabel('T(^oK)'), ylabel('\sigma(S/m)'), title ('Conductivity as function of temperature'), grid on
%plottar konduktivitet som funktion av temperatur

P=1./Sigma;
l=0.0003;
A=0.004;
R= (P.*A)./l;
figure(3)
plot(T,R), xlabel('T(^oK)'), ylabel('R(\Omega)'), title ('Resistance as function of temperature'), grid on
%plottar resistans som funktion av temperatur

Boltzmann=1.38e-23;
Fermi=Boltzmann.*T.*(log(N0)-log(N));
Fermiev=Fermi.*6.2415e18;
figure(4)
plot(T,Fermiev), xlabel('T(^oK)'), ylabel('EF-Ei(eV)'), title ('Fermienergi som funktion av temperatur'), grid on
%plottar fermienergi som funktion av temperatur
