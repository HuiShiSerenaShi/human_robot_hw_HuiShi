close all
clear all
clc

set(cstprefs.tbxprefs,'FrequencyUnits','Hz')

Num = [134.2 134.2*56.01]; Den = [1 0];
Ci = tf(Num,Den)

%data
r = 1; % gear ration
Kt = 0.0705*r; % torque constant
Im = 0.0003*r^2; %  motor inertia Js
Fm = 0.00001*r^2;  % motor friction b
Kv = 1/(2*pi*135/60) *r; % 135 rpm, same as Kt
Ra = 0.343; % armature resistance
La = 0.000264; % armature inductance