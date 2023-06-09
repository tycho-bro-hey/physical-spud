model crank_rod_assembly
  type Length = Real(unit="m", min=0);
  type Angle = Real(unit="rad");
  type AngularVelocity = Real(unit="rad/s");
  type Position = Real(unit="m");
  type Frequency = Real(unit="Hz");
  
  parameter Real RPM = 30 "rotations per minute of crankshaft";
  parameter Length a = 1.0 "crank radius offset";
  parameter Length r = 2.0 "connecting rod length";
  parameter Frequency nu = RPM/60 "frequency of crankshaft's rotation related to engine speed";
   
  Position x(start = 0);
  //Angle phi(start = 0);
  AngularVelocity omega(start=0) = 2*3.1415*nu;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  der(flange_a.phi) = omega;
  x = a * cos(flange_a.phi) + sqrt(r^2 - a^2 * sin(flange_a.phi)^2);
annotation(
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    uses(Modelica(version = "4.0.0")));
end crank_rod_assembly;
