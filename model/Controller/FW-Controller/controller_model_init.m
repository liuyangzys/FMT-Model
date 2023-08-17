model_version = 'v1.0.0';
model_name = 'FW Controller';

%% load configuration
load('control_default_config.mat');

%% Constant Variable
CONTROL_CONST.dt = 0.002;   % model execution period

%% Exported Value
CONTROL_EXPORT_VALUE.period = uint32(CONTROL_CONST.dt*1e3);
CONTROL_EXPORT_VALUE.model_info = int8([model_name, ' ', model_version, 0]); % 0 for end of string
% Export to firmware
CONTROL_EXPORT = Simulink.Parameter(CONTROL_EXPORT_VALUE);
CONTROL_EXPORT.CoderInfo.StorageClass = 'ExportedGlobal';

% Airframe id
AIRFRAME = 1;

%% Paramaters
CONTROL_PARAM_VALUE.ROLL_P = single(7);
CONTROL_PARAM_VALUE.PITCH_P = single(7);
CONTROL_PARAM_VALUE.ROLL_PITCH_CMD_LIM = single(pi/4);

CONTROL_PARAM_VALUE.ROLL_RATE_P = single(0.1);
CONTROL_PARAM_VALUE.PITCH_RATE_P = single(0.2);
CONTROL_PARAM_VALUE.YAW_RATE_P = single(0.15);
CONTROL_PARAM_VALUE.ROLL_RATE_I = single(0.1);
CONTROL_PARAM_VALUE.PITCH_RATE_I = single(0.1);
CONTROL_PARAM_VALUE.YAW_RATE_I = single(0.2);
CONTROL_PARAM_VALUE.RATE_I_MIN = single(-0.1);
CONTROL_PARAM_VALUE.RATE_I_MAX = single(0.1);
CONTROL_PARAM_VALUE.P_Q_CMD_LIM = single(pi/2);
CONTROL_PARAM_VALUE.R_CMD_LIM = single(pi);

CONTROL_PARAM_VALUE.FW_AIRSPEED_TRIM = single(13);
CONTROL_PARAM_VALUE.FW_FF = single(0.2);
CONTROL_PARAM_VALUE.FW_FF_LIMIT = single(0.3);
CONTROL_PARAM_VALUE.FW_PI_LIMIT = single(1);
CONTROL_PARAM_VALUE.FW_ROLL_EFFC = single(1);
CONTROL_PARAM_VALUE.FW_PITCH_EFFC = single(1);
CONTROL_PARAM_VALUE.FW_YAW_EFFC = single(1);
CONTROL_PARAM_VALUE.FW_PITCH_OFFSET = single(3/180*pi);

CONTROL_PARAM_VALUE.FW_TECS_PITCH_F = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_THOR_FF = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_PITCH_P = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_THOR_P = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_PITCH_I = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_THOR_I = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_PITCH_D = single(0);
CONTROL_PARAM_VALUE.FW_TECS_THOR_D = single(0);
CONTROL_PARAM_VALUE.FW_TECS_RATIO = single(1);
CONTROL_PARAM_VALUE.FW_TECS_SWITCH = single(2);
CONTROL_PARAM_VALUE.FW_TECS_ANSW = single(2);
CONTROL_PARAM_VALUE.FW_TECS_W2T = single(1);
CONTROL_PARAM_VALUE.FW_TECS_U2T = single(1);
% CONTROL_PARAM_VALUE.FW_TECS_W2P = single(1);
% CONTROL_PARAM_VALUE.FW_TECS_U2P = single(1);
CONTROL_PARAM_VALUE.FW_TECS_W2P = single(2);
CONTROL_PARAM_VALUE.FW_TECS_U2P = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_R2P = single(0.1);
CONTROL_PARAM_VALUE.FW_TECS_R2T = single(0.1);

% Export to firmware
CONTROL_PARAM = Simulink.Parameter(CONTROL_PARAM_VALUE);
CONTROL_PARAM.CoderInfo.StorageClass = 'ExportedGlobal';