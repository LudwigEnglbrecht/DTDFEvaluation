PROGRAM program0
  VAR
    velocity_rotor_blade AT %IW100 : INT := 0;
    temp_engine AT %IW101 : INT := 0;
    wind_speed AT %IW102 : INT := 0;
    pressure AT %IW103 : INT := 0;
    status_velocity_rotor_blade AT %QW104 : INT := 0;
    status_temp_enginge AT %QW105 : INT := 0;
    status_wind_speed AT %QW106 : INT := 0;
    status_pressure AT %QW107 : INT := 0;
    status_velocity_rotor_blade_persistent AT %MW1 : INT := 200;
    status_temp_enginge_persistent AT %MW2 : INT := 200;
    status_wind_speed_persistent AT %MW3 : INT := 200;
    status_pressure_persistent AT %MW4 : INT := 200;
  END_VAR

  IF velocity_rotor_blade <= 5 THEN
    status_velocity_rotor_blade_persistent := 200;
  ELSIF velocity_rotor_blade <= 8 THEN
    status_velocity_rotor_blade_persistent := 300;
  ELSE
    status_velocity_rotor_blade_persistent := 400;
  END_IF;
  status_velocity_rotor_blade := status_velocity_rotor_blade_persistent;

  IF temp_engine <= 5 THEN
    status_temp_enginge_persistent := 200;
  ELSIF temp_engine <= 8 THEN
    status_temp_enginge_persistent := 300;
  ELSE
    status_temp_enginge_persistent := 400;
  END_IF;
  status_temp_enginge := status_temp_enginge_persistent;

  IF wind_speed <= 5 THEN
    status_wind_speed_persistent := 200;
  ELSIF wind_speed <= 8 THEN
    status_wind_speed_persistent := 300;
  ELSE
    status_wind_speed_persistent := 400;
  END_IF;
  status_wind_speed := status_wind_speed_persistent;

  IF pressure <= 5 THEN
    status_pressure_persistent := 200;
  ELSIF pressure <= 8 THEN
    status_pressure_persistent := 300;
  ELSE
    status_pressure_persistent := 400;
  END_IF;
  status_pressure := status_pressure_persistent;


END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#5s0ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
