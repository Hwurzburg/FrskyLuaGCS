-- This file was automatically generated by FrskyLuaGCSGui

local description = "Plane Params"

local parameters = {
--[[
  Enables airspeed use for automatic throttle modes and replaces control from THR_TRIM. Continues to display and log airspeed if set to 0. Uses airspeed for control if set to 1. Only uses airspeed when throttle = 0 if set to 2 (useful for gliders with airspeed sensors behind propellers).
--]]
{"ARSPD_USE",{"DoNotUse","Use","UseWhenZeroThrottle",},{0,1,2,}},

--[[
  This parameter allows you to skip airspeed offset calibration on startup, instead using the offset from the last calibration. This may be desirable if the offset variance between flights for your sensor is low and you want to avoid having to cover the pitot tube on each boot.
--]]
{"ARSPD_SKIP_CAL",{"Disable","Enable",},{0,1,}},

--[[
  This sets the rate in m/s at which FBWB and CRUISE modes will change its target altitude for full elevator deflection. Note that the actual climb rate of the aircraft can be lower than this, depending on your airspeed and throttle control settings. If you have this parameter set to the default value of 2.0, then holding the elevator at maximum deflection for 10 seconds would change the target altitude by 20 meters.
--]]
{"FBWB_CLIMB_RATE",1,10,0.1,"m/s",},

--[[
  Degrees of down pitch added when throttle is below TRIM_THROTTLE in FBWA and AUTOTUNE modes. Scales linearly so full value is added when THR_MIN is reached. Helps to keep airspeed higher in glides or landing approaches and prevents accidental stalls. 2 degrees recommended for most planes.
--]]
{"STAB_PITCH_DOWN",0,15,0.1,"deg",},

--[[
  Maximum throttle percentage used in automatic throttle modes.
--]]
{"THR_MAX",0,100,1,"%",},

--[[
  Target airspeed in cm/s in automatic throttle modes. Value is as an indicated (calibrated/apparent) airspeed.
--]]
{"TRIM_ARSPD_CM",0,1000000,1,"cm/s",},

--[[
  Maximum airspeed demanded in automatic throttle modes. Should be set slightly less than level flight speed at THR_MAX and also at least 50% above ARSPD_FBW_MIN to allow for accurate TECS altitude control.
--]]
{"ARSPD_FBW_MAX",5,100,1,"m/s",},

--[[
  Minimum airspeed demanded in automatic throttle modes. Should be set to 20% higher than level flight stall speed.
--]]
{"ARSPD_FBW_MIN",5,100,1,"m/s",},

--[[
  Target percentage of throttle to apply for flight in automatic throttle modes and throttle percentage that maintains TRIM_ARSPD_CM. Caution: low battery voltages at the end of flights may require higher throttle to maintain airspeed.
--]]
{"TRIM_THROTTLE",0,100,1,"%",},

--[[
  Level of aggressiveness of pitch and roll PID gains. Lower values result in a 'softer' tune. Level 6 recommended for most planes.
--]]
{"AUTOTUNE_LEVEL",1,10,1,"",},

--[[
  Compensates for the pitch angle difference between the control board and the frame. Positive values make the vehicle pitch up/back.
--]]
{"AHRS_TRIM_Y",-0.1745,0.1745,0.01,"rad",},

--[[
  Compensates for the roll angle difference between the control board and the frame. Positive values make the vehicle roll right.
--]]
{"AHRS_TRIM_X",-0.1745,0.1745,0.01,"rad",},

--[[
  Used in autoland to give the minimum pitch in the final stage of landing (after the flare). This parameter can be used to ensure that the final landing attitude is appropriate for the type of undercarriage on the aircraft. Note that it is a minimum pitch only - the landing code will control pitch above this value to try to achieve the configured landing sink rate.
--]]
{"LAND_PITCH_CD",-1000000,1000000,10,"cdeg",},

--[[
  Maximum bank angle commanded in modes with stabilized limits. Increase this value for sharper turns, but decrease to prevent accelerated stalls.
--]]
{"LIM_ROLL_CD",0,9000,10,"cdeg",},

--[[
  Checks prior to arming motor. This is a bitmask of checks that will be performed before allowing arming. The default is no checks, allowing arming at any time. You can select whatever checks you prefer by adding together the values of each check type to set this parameter. For example, to only allow arming when you have GPS lock and no RC failsafe you would set ARMING_CHECK to 72. For most users it is recommended that you set this to 1 to enable all checks.
--]]
{"ARMING_CHECK",{"None","All","No GPS","No Logging","No INS",},{0,1,258038,261118,262126,}},

}
return { list = parameters,description = description}
