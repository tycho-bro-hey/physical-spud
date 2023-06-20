model spudDiaphragmPump
  import Modelica.Units.SI.*;

  parameter Length r = 25e-3 "crank radius offset";
  parameter Length L = 50e-3 "connecting rod length";
  parameter Area A = 0.025 "area of cylinder";
  parameter Mass m = 5e-5 "mass of piston in kg";
  parameter Modelica.Thermal.FluidHeatFlow.Media.Air_30degC air_30degC annotation(
    Placement(visible = true, transformation(origin = {-66, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a rotationIN annotation(
    Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.AccSensor accSensor annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Translational.Interfaces.Flange piston annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {20, 1.77636e-15}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput pressureOUT annotation(
    Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));  
  
  Velocity v;
  Acceleration acc;
  Force f_piston;
  Pressure p = pressureOUT;
  
  
equation
//equations for crank-rod assembly
  piston.s = r*cos(rotationIN.phi) + sqrt(L^2 - r^2*sin(rotationIN.phi)^2) - r*2;
  v = (der(piston.s))*speedSensor.w;
  acc = (der(v))*speedSensor.w^2;
  f_piston = m*acc;
  p = (f_piston/A);

  connect(speedSensor.flange, rotationIN) annotation(
    Line(points = {{-100, 40}, {-100, 20}, {-70, 20}, {-70, 0}}));
  connect(rotationIN, accSensor.flange) annotation(
    Line(points = {{-70, 0}, {-70, -20}, {-100, -20}, {-100, -40}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-54, -12}, {-54, -12}})}),
    uses(Modelica(version = "4.0.0")),
  Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(origin = {89, -1}, extent = {{-1, -1}, {1, 1}}), Rectangle(origin = {41, 0}, extent = {{-41, 20}, {41, -20}}), Ellipse(origin = {-80, 0}, extent = {{-20, 20}, {20, -20}}), Rectangle(origin = {-28, 3}, rotation = -8, fillPattern = FillPattern.Solid, extent = {{-48, 5}, {48, -5}}), Rectangle(origin = {59, 0}, fillColor = {0, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-3, 20}, {3, -20}}), Text(origin = {58, -2}, rotation = 90, extent = {{-14, 2}, {14, -2}}, textString = "diaphragm"), Rectangle(origin = {21, 0}, fillPattern = FillPattern.Solid, extent = {{21, 20}, {-21, -20}}), Ellipse(origin = {-70, 8}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-3, 4}, {3, -3}})}));


end spudDiaphragmPump;
