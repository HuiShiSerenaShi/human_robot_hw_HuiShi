function u = controller(pos, t)

persistent last_t;
persistent last_pos;
persistent i_vel_e;

if isempty(last_pos)
    last_pos =pos;
end

% One time variable initialization --------
if isempty(last_t)
    last_t = 0;
end
% ----------------------------------------

if isempty(i_vel_e)
    i_vel_e = 0;
end

dt = t - last_t;

% Dirty fix to avoid division by zero --------
if dt == 0
    dt = 1e-4;
end

% --------------------------------------------
% implement your controller here
% -------------------------------------------- 
ref = 1;
pos_controller= 66.955;
vel = (pos-last_pos)/dt;
ref_vel=(ref-pos)*pos_controller;

vel_e = ref_vel - vel;
  % 
  % 0.056382 (s+0.0003498)
  % ----------------------
  %           s
Pv=0.056382;
Iv=0.056382*0.0003498;
i_vel_e = i_vel_e + vel_e*dt;
vel_controller= Pv*vel_e + Iv*i_vel_e;

u =vel_controller;
last_t = t;
last_pos=pos;