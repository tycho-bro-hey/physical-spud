model spring_cylinder_test
  Modelica.Thermal.FluidHeatFlow.Components.Cylinder pne_cylinder(A = 0.013, L(displayUnit = "mm") = 0.05080000000000001, medium = air_30degC, s(displayUnit = "m"))  annotation(
    Placement(visible = true, transformation(origin = {34, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {-40, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.Thermal.FluidHeatFlow.Media.Air_30degC air_30degC annotation(
    Placement(visible = true, transformation(origin = {-84, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.5, height = -1, offset = 0, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-78, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  compressorSPUD compressorSPUD1 annotation(
    Placement(visible = true, transformation(origin = {3, 37}, extent = {{-43, -43}, {43, 43}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Spring spring(c = 0.01, s_rel0(displayUnit = "mm") = 0.05080000000000001)  annotation(
    Placement(visible = true, transformation(origin = {-6, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(compressorSPUD1.flowPort_b, pne_cylinder.flowPort) annotation(
    Line(points = {{46, 38}, {76, 38}, {76, -36}, {44, -36}}, color = {255, 0, 0}));
  connect(ramp.y, compressorSPUD1.u) annotation(
    Line(points = {{-66, 38}, {-38, 38}}, color = {0, 0, 127}));
  connect(fixed.flange, spring.flange_a) annotation(
    Line(points = {{-40, -36}, {-16, -36}}, color = {0, 127, 0}));
  connect(spring.flange_b, pne_cylinder.flange) annotation(
    Line(points = {{4, -36}, {24, -36}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end spring_cylinder_test;
