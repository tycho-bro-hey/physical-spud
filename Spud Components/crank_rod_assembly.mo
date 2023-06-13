model crank_rod_assembly
  import Modelica.Units.SI.*;

  parameter Length r = 25e-3 "crank radius offset";
  parameter Length L = 50e-3 "connecting rod length";
  parameter Area A = 0.05 "area of cylinder";
  parameter Mass m = 5e-3 "mass of piston in kg";
  parameter Modelica.Thermal.FluidHeatFlow.Media.Air_30degC air_30degC annotation(
    Placement(visible = true, transformation(origin = {-66, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-88, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
  Distance x;
  Velocity v;
  Acceleration acc;
  Force f_piston;
  Pressure p(start=0);

equation
//equations for crank-rod assembly
  x = r*cos(flange_a.phi) + sqrt(L^2 - r^2*sin(flange_a.phi)^2) - 25e-3;
  v = (der(x))*speedSensor.w;
  acc = (der(v))*speedSensor.w^2;
  f_piston = m*acc;
  p = f_piston/A;
  connect(speedSensor.flange, flange_a) annotation(
    Line(points = {{-100, 40}, {-100, 0}}));
 connect(flange_a, accSensor.flange) annotation(
    Line(points = {{-100, 0}, {-100, -40}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    uses(Modelica(version = "4.0.0")));
end crank_rod_assembly;
