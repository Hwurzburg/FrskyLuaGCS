#include "includes/ardupilot_inc.lua"
#include "includes/colors_inc.lua"

#define MIN_X 0
#define MIN_Y 32

#define X_COLUMN_1 3
#define X_COLUMN_2 123
#define X_COLUMN_3 243
#define X_COLUMN_4 363

#define COLUMN_WIDTH 120

local description = "Heli Tuning"
local labelWidth = 54
local columnWidth = COLUMN_WIDTH
local boxes = {
  {label="Stabilize Roll"     , x=MIN_X       ,y=MIN_Y      ,width=COLUMN_WIDTH,height=24, color=lcd.RGB(255,255,255)},
  {label="Stabilize Pitch"    , x=MIN_X+120   ,y=MIN_Y      ,width=COLUMN_WIDTH,height=24, color=lcd.RGB(255,255,255)},
  {label="Stabilize Yaw"      , x=MIN_X+240   ,y=MIN_Y      ,width=COLUMN_WIDTH,height=24, color=lcd.RGB(255,255,255)},
  {label="Stabilize Loiter"   , x=MIN_X+360   ,y=MIN_Y      ,width=COLUMN_WIDTH,height=24, color=lcd.RGB(255,255,255)},
  
  {label="Rate Roll"          , x=MIN_X       ,y=MIN_Y+38   ,width=COLUMN_WIDTH,height=90, color=lcd.RGB(255,255,255)},
  {label="Rate Pitch"         , x=MIN_X+120   ,y=MIN_Y+38   ,width=COLUMN_WIDTH,height=90, color=lcd.RGB(255,255,255)},
  {label="Rate Yaw"           , x=MIN_X+240   ,y=MIN_Y+38   ,width=COLUMN_WIDTH,height=90, color=lcd.RGB(255,255,255)},
  {label="Rate Loiter"        , x=MIN_X+360   ,y=MIN_Y+38   ,width=COLUMN_WIDTH,height=74, color=lcd.RGB(255,255,255)},
  
  {label="Throttle Accel"     , x=MIN_X       ,y=MIN_Y+142  ,width=COLUMN_WIDTH,height=80, color=lcd.RGB(255,255,255)},
  {label="Throttle Rate"      , x=MIN_X+120   ,y=MIN_Y+142  ,width=COLUMN_WIDTH,height=24, color=lcd.RGB(255,255,255)},
  {label="Alt Hold"           , x=MIN_X+240   ,y=MIN_Y+142  ,width=COLUMN_WIDTH,height=24, color=lcd.RGB(255,255,255)},
  {label="WP Nav cm/s"        , x=MIN_X+360   ,y=MIN_Y+126  ,width=COLUMN_WIDTH,height=96, color=lcd.RGB(255,255,255)},
  
  {label="Autotune"           , x=MIN_X+120   ,y=MIN_Y+178  ,width=COLUMN_WIDTH,height=44, color=lcd.RGB(255,255,255)},
}

--[[
VALUE
{ 
  1 name
  2 min  
  3 max 
  4 increment (float)
  5 unit of measure,
}
COMBO
{
  1 name, 
  2 label list, 
  3 value list, 
}
--]]
local parameters = {
  -- row 1
  {"ATC_ANG_RLL_P"        , 0, 12.0, 0.05           , x=X_COLUMN_1,y=MIN_Y+5,label="P"},
  {"ATC_ANG_PIT_P"        , 0, 12.0, 0.05           , x=X_COLUMN_2,y=MIN_Y+5,label="P"},
  {"ATC_ANG_YAW_P"        , 0, 12.0, 0.05           , x=X_COLUMN_3,y=MIN_Y+5,label="P"},
  {"PSC_POSXY_P"          , 0.5, 2, 0.1             , x=X_COLUMN_4,y=MIN_Y+5,label="P"},
  
  -- row 2
  {"ATC_RAT_RLL_P"        , 0.08, 0.35, 0.005       , x=X_COLUMN_1,y=MIN_Y+43,label="P"},
  {"ATC_RAT_RLL_I"        , 0.01, 0.6, 0.01         , x=X_COLUMN_1,y=MIN_Y+59,label="I"},
  {"ATC_RAT_RLL_D"        , 0.001, 0.03, 0.001      , x=X_COLUMN_1,y=MIN_Y+75,label="D"},
  {"ATC_RAT_RLL_IMAX"     , 0, 1, 0.01              , x=X_COLUMN_1,y=MIN_Y+91,label="IMAX"},
  --{"ATC_RAT_RLL_FILT"   , 1, 20, 1                , x=X_COLUMN_1,y=MIN_Y+107,label="FILT"},
  
  {"ATC_RAT_PIT_P"        , 0.08, 0.35, 0.005       , x=X_COLUMN_2,y=MIN_Y+43,label="P"},
  {"ATC_RAT_PIT_I"        , 0.01, 0.6, 0.01         , x=X_COLUMN_2,y=MIN_Y+59,label="I"},
  {"ATC_RAT_PIT_D"        , 0.001, 0.03, 0.001      , x=X_COLUMN_2,y=MIN_Y+75,label="D"},
  {"ATC_RAT_PIT_IMAX"     , 0, 1, 0.01              , x=X_COLUMN_2,y=MIN_Y+91,label="IMAX"},
  --{"ATC_RAT_PIT_FILT"   , 1, 20, 1                , x=X_COLUMN_2,y=MIN_Y+107,label="FILT"},
  
  {"ATC_RAT_YAW_P"        , 0.18, 0.6, 0.005        , x=X_COLUMN_3,y=MIN_Y+43,label="P"},
  {"ATC_RAT_YAW_I"        , 0.01, 0.06, 0.01        , x=X_COLUMN_3,y=MIN_Y+59,label="I"},
  {"ATC_RAT_YAW_D"        , 0.0, 0.02, 0.001        , x=X_COLUMN_3,y=MIN_Y+75,label="D"},
  {"ATC_RAT_YAW_IMAX"     , 0, 1, 0.01              , x=X_COLUMN_3,y=MIN_Y+91,label="IMAX"},
  --{"ATC_RAT_YAW_FILT"   , 1, 20, 1                , x=X_COLUMN_3,y=MIN_Y+107,label="FILT"},
  
  {"PSC_VELXY_P"          , 0.1, 6.0, 0.1           , x=X_COLUMN_4,y=MIN_Y+43,label="P"},
  {"PSC_VELXY_I"          , 0.02, 1.0, 0.01         , x=X_COLUMN_4,y=MIN_Y+59,label="I"},
  {"PSC_VELXY_D"          , 0.0, 1.0, 0.001         , x=X_COLUMN_4,y=MIN_Y+75,label="D"},
  {"PSC_VELXY_IMAX"       , 0, 4500, 10             , x=X_COLUMN_4,y=MIN_Y+91,label="IMAX"},
  
  -- row 3
  {"PSC_ACCZ_P"           , 0.5, 1.5, 0.05          , x=X_COLUMN_1,y=MIN_Y+147,label="P"},
  {"PSC_ACCZ_I"           , 0.0, 3.0, 0.05          , x=X_COLUMN_1,y=MIN_Y+163,label="I"},
  {"PSC_ACCZ_D"           , 0.0, 0.4, 0.01          , x=X_COLUMN_1,y=MIN_Y+179,label="D"},
  {"PSC_ACCZ_IMAX"        , 0, 1000, 1              , x=X_COLUMN_1,y=MIN_Y+195,label="IMAX"},

  {"PSC_VELZ_P"           , 1, 8.0, 0.25            , x=X_COLUMN_2,y=MIN_Y+147,label="P"},

  {"PSC_POSZ_P"           , 1, 3.0, 0.1             , x=X_COLUMN_3,y=MIN_Y+147,label="P"},

  {"WPNAV_SPEED"          , 20, 2000, 50            , x=X_COLUMN_4,y=MIN_Y+133,label="Speed"},
  {"WPNAV_RADIUS"         , 5, 1000, 1              , x=X_COLUMN_4,y=MIN_Y+148,label="Radius"},
  {"WPNAV_SPEED_UP"       , 10, 1000, 50            , x=X_COLUMN_4,y=MIN_Y+164,label="Spd Up"},
  {"WPNAV_SPEED_DN"       , 10, 500, 10             , x=X_COLUMN_4,y=MIN_Y+180,label="Spd Dn"},
  {"LOIT_SPEED"           , 20, 2000, 50            , x=X_COLUMN_4,y=MIN_Y+196,label="Loiter"},
  
  -- row 4
  {"AUTOTUNE_AXES", TYPECOMBO, 1, {"All","Roll","Ptch","Yaw","R+P","R+Y","P+Y"}, {7,1,2,3,4,5,6}, x=X_COLUMN_2,y=MIN_Y+184,label="Axis"},
  {"AUTOTUNE_AGGR"        , 0.05, 0.1, 0.01         , x=X_COLUMN_2,y=MIN_Y+200,label="Aggr"},
}

return {
  list=parameters,
  description=description,
  boxes=boxes,
  labelWidth=labelWidth,
  columnWidth=columnWidth,
  listType=2 -- tuning panel
}