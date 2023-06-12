model crank_rod_assembly
  import Modelica.Units.SI.*;

  parameter Length a = 1.0 "crank radius offset";
  parameter Length r = 2.0 "connecting rod length";

 

  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-88, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Interfaces.Flange flange annotation(
    Placement(visible = true, transformation(origin = {-2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  flange.s = a*cos(flange_a.phi) + sqrt(r^2 - a^2*sin(flange_a.phi)^2);
  connect(speedSensor.flange, flange_a) annotation(
    Line(points = {{-80, 20}, {-80, 21}, {-100, 21}, {-100, 0}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    uses(Modelica(version = "4.0.0")));
end crank_rod_assembly;
