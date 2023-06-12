model crank_rod_assembly

  type Length = Real(final quantity = "Length", final unit="m");
  type Position = Length;
  
  type Angle = Real (
      final quantity="Angle",
      final unit="rad",
      displayUnit="deg");
  type AngularVelocity = Real (
      final quantity="AngularVelocity",
      final unit="rad/s");
  type Frequency = Real (final quantity="Frequency", final unit="Hz");
  type AngularFrequency = Real (final quantity="AngularFrequency", final unit="rad/s");
  type stiffness = Real (final quantity="stiffness", final unit="N/m");
  
  
  parameter Length a = 1.0 "crank radius offset";
  parameter Length r = 2.0 "connecting rod length";
  parameter stiffness k = 1.0 "piston's resistance to move";
 
  Real F;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-88, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
 Modelica.Mechanics.Translational.Interfaces.Flange flange annotation(
    Placement(visible = true, transformation(origin = {-2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  F = k *flange.s;
  flange.s = a*cos(flange_a.phi) + sqrt(r^2 - a^2*sin(flange_a.phi)^2);
  connect(speedSensor.flange, flange_a) annotation(
    Line(points = {{-80, 20}, {-80, 21}, {-100, 21}, {-100, 0}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    uses(Modelica(version = "4.0.0")));
end crank_rod_assembly;
