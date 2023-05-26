model test_motor
  Modelica.Blocks.Sources.Ramp ramp(duration = 2, height = -1, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-76, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  testComp_with_Motor testComp_with_Motor1 annotation(
    Placement(visible = true, transformation(origin = {4, 2}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor annotation(
    Placement(visible = true, transformation(origin = {76, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PositionSensor positionSensor annotation(
    Placement(visible = true, transformation(origin = {64, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, testComp_with_Motor1.u) annotation(
    Line(points = {{-64, 0}, {-26, 0}, {-26, 2}}, color = {0, 0, 127}));
  connect(angleSensor.flange, testComp_with_Motor1.flange_b) annotation(
    Line(points = {{66, 40}, {36, 40}, {36, 2}}));
  connect(positionSensor.flange, testComp_with_Motor1.flange_b1) annotation(
    Line(points = {{54, -62}, {2, -62}, {2, -22}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end test_motor;
