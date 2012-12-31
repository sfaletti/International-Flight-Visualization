class FlightNode {
  
  String fromCountry;
  String toCountry;
  int pass90;
  int pass95;
  int pass00;
  int pass05;
  int pass10;

  FlightNode (String _fromCountry, String _toCountry, 
  String _pass90, String _pass95, String _pass00, String _pass05, String _pass10) {
    fromCountry = _fromCountry;
    toCountry = _toCountry;
    pass90 = int(_pass90);
    pass95 = int(_pass95);
    pass00 = int(_pass00);
    pass05 = int(_pass05);
    pass10 = int(_pass10);
  }

  void addPass(FlightNode _flightNode) {
    pass90 += _flightNode.pass90;
    pass95 += _flightNode.pass95;
    pass00 += _flightNode.pass00;
    pass05 += _flightNode.pass05;
    pass10 += _flightNode.pass10;
  }

  void printFlightNode() {
    println("From: " + fromCountry);
    println("To: " + toCountry);
    println("1990: " + pass90);
    println("1995: " + pass95);
    println("2000: " + pass00);
    println("2005: " + pass05);
    println("2010: " + pass10);
  }

  boolean isNodeEqual (FlightNode _flightNode) {
    if (fromCountry.equals(_flightNode.fromCountry) && toCountry.equals(_flightNode.toCountry)) {
      return true;
    }
    else {
      return false;
    }
  }
  
  boolean isBetweenCountries (FlightNode _flightNode) {
    if (fromCountry.equals(_flightNode.toCountry) && toCountry.equals(_flightNode.fromCountry)) {
      return true;
    }
    else {
      return false;
    }
  }
  
}

