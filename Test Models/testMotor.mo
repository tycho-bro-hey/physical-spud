model testMotor
  DCPMspud dCPMspud annotation(
    Placement(visible = true, transformation(origin = {-5, 1}, extent = {{-27, -27}, {27, 27}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 0.15)  annotation(
    Placement(visible = true, transformation(origin = {46, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.SignTorque signTorque annotation(
    Placement(visible = true, transformation(origin = {82, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.8, height = 100, offset = 0, startTime = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-70, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dCPMspud.load, inertia.flange_a) annotation(
    Line(points = {{12, 0}, {24.28, 0}, {24.28, 2.46}, {36.28, 2.46}}));
  connect(inertia.flange_b, signTorque.flange) annotation(
    Line(points = {{56, 2}, {60, 2}, {60, 42}, {72, 42}}));
  connect(ramp.y, dCPMspud.u) annotation(
    Line(points = {{-58, 2}, {-40, 2}, {-40, 1}, {-21, 1}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end testMotor;
