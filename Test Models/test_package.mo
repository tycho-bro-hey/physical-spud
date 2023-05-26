package test_package

  model Piston
    parameter Real stroke = 0.05; // Piston stroke length [m]
    parameter Real diameter = 0.02; // Piston diameter [m]
    Real position(start = 0, fixed = true); // Piston position [m]
  equation
    der(position) = if time < 1.0 then 0.02 else -0.02; // Example crankshaft rotation control
  end Piston;

  model Diaphragm
    parameter Real area = 0.01; // Diaphragm surface area [m^2]
    Real position; // Diaphragm position [m]
  equation
    position = -Piston.position; // Diaphragm position is opposite to piston position
  end Diaphragm;

  model Pump
    Piston piston;
    Diaphragm diaphragm;
    Real suctionPressure; // Suction pressure [Pa]
    Real dischargePressure; // Discharge pressure [Pa]
  equation
    suctionPressure = 101325 + 2000 * sin(time); // Example suction pressure control (adjust as needed)
    dischargePressure = 101325; // Constant discharge pressure
    assert(suctionPressure > dischargePressure, "Suction pressure must be greater than discharge pressure");
  end Pump;

  model SuctionSystem
    Pump pump;
    parameter Real suctionArea = 0.005; // Suction cup area [m^2]
    Real suctionForce; // Suction force [N]
  equation
    suctionForce = suctionArea * (pump.suctionPressure - atmosphere.pressure); // Suction force calculation
  end SuctionSystem;

  model Atmosphere
    parameter Real pressure = 101325; // Atmospheric pressure [Pa]
  end Atmosphere;

end test_package;
