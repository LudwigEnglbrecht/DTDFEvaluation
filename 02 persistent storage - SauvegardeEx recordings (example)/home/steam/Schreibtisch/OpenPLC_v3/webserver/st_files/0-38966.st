PROGRAM program0
  VAR
    PB1 AT %MW0.0 : INT;
    PB2 AT %MW0.1 : INT;
    PB3 AT %MW0.2 : INT;
    PB4 AT %MW0.3 : INT;
  END_VAR

  IF PB1<1 THEN
      WHILE PB2 < 8000 DO
          PB2 := PB2 + 1;
          PB3 := PB3 + 10;
          PB4 := PB4 + 20;
      END_WHILE;
  END_IF;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#55ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
