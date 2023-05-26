model RLC_Circuit "resistor-inductor-capactior circuit model"
  type Voltage=Real(unit="V");
  type Current=Real(unit="A");
  type Resistance=Real(unit="Ohm");
  type Capacitance=Real(unit="F");
  type Inductance=Real(unit="H");
  parameter Voltage Vb=24 "Battery Voltage Source";
  parameter Resistance R = 100;
  parameter Inductance L = 1;
  parameter Capacitance C = 1e-3;
  Voltage V;
  Current i_L;
  Current i_R;
  Current i_C;
equation
  V = i_R*R;
  C*der(V) = i_C;
  L*der(i_L) = (Vb-V);
  i_L = i_R + i_C;
  annotation(experiment(StartTime = 0,StopTime = 5));
end RLC_Circuit;
