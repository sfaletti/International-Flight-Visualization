String[] flightData;
String[][] parsedData;
FlightNode[] flightNodesHolder;

void setup() {

  flightData  = loadStrings("citiesToCitiesPass.csv");
  parsedData = new String[flightData.length][7];
  flightNodesHolder = new FlightNode[1];

  for (int i=0; i<flightData.length; i++) {
    parsedData[i] = split(flightData[i], ',');
    parsedData[i] = trim(parsedData[i]);
    if (parsedData[i][1].length() == 2) {
      parsedData[i][1] = "USA";
    }
    if (parsedData[i][3].length() == 2) {
      parsedData[i][3] = "USA";
    }

    FlightNode flightHolder = new FlightNode(parsedData[i][1], parsedData[i][3], parsedData[i][4], parsedData[i][5], parsedData[i][6], parsedData[i][7], parsedData[i][8]);

    if (i == 0) { //fill the first flightNodesHolder slot
      flightNodesHolder[0] = flightHolder;
    }
    else if (i > 0) {
      boolean flightEqualFlag = false;
      for (int a=0; a<flightNodesHolder.length; a++) {
        if (flightNodesHolder[a].isNodeEqual(flightHolder)) {
          flightNodesHolder[a].addPass(flightHolder);
          flightEqualFlag = true;
          break;
        }
      }
      if (!flightEqualFlag) {
        flightNodesHolder = (FlightNode[])append(flightNodesHolder, flightHolder);
      }
    }
  }
  for (int i=0; i<flightNodesHolder.length; i++) {
    println("node count: " + i);
    flightNodesHolder[i].printFlightNode();
  }
}

void draw() {
}

