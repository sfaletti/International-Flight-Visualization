String[] flightData;
String[][] parsedData;
FlightNode[] flightNodes;

void setup() {

  flightData  = loadStrings("citiesToCitiesPass.csv");
  parsedData = new String[flightData.length][7];
  flightNodes = new FlightNode[flightData.length];

  for (int i=0; i<flightData.length; i++) {
    parsedData[i] = split(flightData[i], ',');
    parsedData[i] = trim(parsedData[i]);
    if (parsedData[i][1].length() == 2) {
      parsedData[i][1] = "USA";
    }
    if (parsedData[i][3].length() == 2) {
      parsedData[i][3] = "USA";
    }
    //  if (parsedData[i][3] == "United Kingdom") {
    println(parsedData[i]);
    //  }
  }
}

