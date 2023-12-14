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

Num = [1]; Den = [La Ra];
el = tf(Num,Den)

Num = [1]; Den = [Im Fm];
mech = tf(Num,Den)

% sisotool(mech);%velocity_controller from here
Num = [0.056382 0.056382*0.0003498]; Den = [1 0];
velocity_controller=tf(Num,Den)

% 0.056382 (s+0.0003498)
%   ----------------------
%             s
s=tf(1,[1 0]);
vel_feedback_block = feedback(velocity_controller*mech,1)*s

sisotool(vel_feedback_block)




