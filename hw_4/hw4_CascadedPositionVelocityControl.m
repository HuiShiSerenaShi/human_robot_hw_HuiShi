close all
clear all
clc

set(cstprefs.tbxprefs,'FrequencyUnits','Hz')

%data
r = 1; % gear ration
Kt = 0.0705*r; % torque constant
% Im = 0.0003*r^2; %  motor inertia Js
% Fm = 0.00001*r^2;  % motor friction b
% real motor
Im = 0.0104*r^2; %  motor inertia Js
Fm = 0.0068*r^2;  % motor friction b
Kv = 1/(2*pi*135/60) *r; % 135 rpm, same as Kt
Ra = 0.343; % armature resistance
La = 0.000264; % armature inductance
% real motor
% Jm = 0.0104;
% dm = 0.0068;

Num = [1]; Den = [La Ra];
el = tf(Num,Den)

Num = [1]; Den = [Im Fm];
mech = tf(Num,Den)

% sisotool(mech);%velocity_controller from here
% Num = [0.056382 0.056382*0.0003498]; Den = [1 0];
% Num = [0.65663 0.65663*0.7666]; Den = [1 0]; % 10hz
% Num = [1.9735 1.9735*0.8183]; Den = [1 0]; % 30hz
Num = [5.3121 5.3121*1.502]; Den = [1 0]; % 81.3hz
velocity_controller=tf(Num,Den)
% 
% % 0.056382 (s+0.0003498)
% %   ----------------------
% %             s
% real motor
  % 0.65663 (s+0.7666)
  % ------------------    10hz
  %         s

  %   1.9735 (s+0.8183)
  % -----------------          30hz
  %         s

  % 62.381   9.48hz

  % 5.3121 (s+1.502)
  % ----------------       81.3hz
  %        s
  % 61.04  9.66hz

s=tf(1,[1 0]);
vel_feedback_block = feedback(velocity_controller*mech,1)*s

sisotool(vel_feedback_block)





