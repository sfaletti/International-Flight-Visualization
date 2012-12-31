class FlightNode {
  String fromCity;
  String fromCountry;
  String toCity;
  String toCountry;
  int pass90;
  int pass95;
  int pass00;
  int pass05;
  int pass10;

  FlightNode (String _fromCity, String _fromCountry, String _toCity, String _toCountry, 
  int _pass90, int _pass95, int _pass00, int _pass05, int _pass10) {
    fromCity = _fromCity;
    fromCountry = _fromCountry;
    toCity = _toCity;
    toCountry = _toCountry;
    pass90 = _pass90;
    pass95 = _pass95;
    pass00 = _pass00;
    pass05 = _pass05;
    pass10 = _pass10;
  }
}

