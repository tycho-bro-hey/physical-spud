model test_comp_with_rod
  compressorSPUD compressorSPUD1 annotation(
    Placement(visible = true, transformation(origin = {-1, -1}, extent = {{-43, -43}, {43, 43}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 0.5, height = -9, offset = 0, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp.y, compressorSPUD1.u) annotation(
    Line(points = {{-70, 0}, {-42, 0}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end test_comp_with_rod;
