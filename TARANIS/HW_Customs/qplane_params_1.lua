-- This file was automatically generated by FrskyLuaGCSGui

local description = "                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      QuadPlane Params"

local parameters = {
--[[
  Maximum lean angle in all VTOL flight modes
--]]
{"Q_ANGLE_MAX",1000,8000,1,"cdeg",},

--[[
  Loiter maximum lean angle. Set to zero for 2/3 of PSC_ANGLE_MAX or ANGLE_MAX
--]]
{"Q_LOIT_ANG_MAX",0,45,1,"deg",},

--[[
  This provides a set of additional control options for quadplanes. LevelTransition means that the wings should be held level to within LEVEL_ROLL_LIMIT degrees during transition to fixed wing flight, and the vehicle will not use the vertical lift motors to climb during the transition. If AllowFWTakeoff bit is not set then fixed wing takeoff on quadplanes will instead perform a VTOL takeoff. If AllowFWLand bit is not set then fixed wing land on quadplanes will instead perform a VTOL land. If respect takeoff frame is not set the vehicle will interpret all takeoff waypoints as an altitude above the corrent position. When Use QRTL is set it will replace QLAND with QRTL for failsafe actions when in VTOL modes.
--]]
{"Q_OPTIONS",{"None","LevelTrans","QRTLFailsafe","FWApproach","Level+QRTL","Lvl+QRTL+FWApp"},{0,1,32,16,33,49},},

--[[
  If this is set to 1 then an RTL will change to QRTL when within RTL_RADIUS meters of the RTL destination
--]]
{"Q_RTL_MODE",{"Disabled","Enabled",},{0,1,}},

--[[
  This is the angle at which tailsitter aircraft will change from VTOL control to fixed wing control.
--]]
{"Q_TAILSIT_ANGLE",5,80,1,"",},

--[[
  This sets the compensation for the pitch angle trim difference between forward and vertical flight pitch, NOTE! this is relative to forward flight trim not mounting locaiton. For tailsitters this is relative to a baseline of 90 degrees.
--]]
{"Q_TRIM_PITCH",-10,10,0.1,"deg",},

}
return { list = parameters,description = description}
