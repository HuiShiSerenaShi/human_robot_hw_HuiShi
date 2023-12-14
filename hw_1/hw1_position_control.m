close all
clear all
clc

set(cstprefs.tbxprefs,'FrequencyUnits','Hz')

%data
r = 1; % gear ration
Kt = 0.0705*r; % torque constant
Im = 0.0003*r^2; %  motor inertia Js
Fm = 0.00001*r^2;  % motor friction b
Kv = 1/(2*pi*135/60) *r; % 135 rpm, same as Kt
Ra = 0.343; % armature resistance
La = 0.000264; % armature inductance


Num = [Kt]; Den = [La Ra];

armature = tf(Num,Den)

Num = [1]; Den = [Im Fm];
load = tf(Num,Den)

Num = [1]; Den = [1 0];
integrator = tf(Num,Den)

series_block = armature*load
feedback_block = series_block/(1+Kt*series_block)
%minreal(feedback_block)
plant = minreal(feedback_block*integrator)

sisotool(plant)


