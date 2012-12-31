void parseCountryData() {
  flightCountries = trim(loadStrings("countriesToCountries.csv"));
  splitCountries = new String[flightCountries.length][3];
  for (int i=0; i<flightCountries.length; i++) {
    splitCountries[i] = trim(split(flightCountries[i], ","));
    if (!splitCountries[i][0].equals(splitCountries[i][1])) {
      CountryNode nodeHolder = new CountryNode(splitCountries[i][0], splitCountries[i][1], splitCountries[i][2]);
      countryNodes = (CountryNode[])append(countryNodes, nodeHolder);
    }
  }
}

void parseCityData() {

  flightData  = loadStrings("citiesToCitiesPass.csv");
  parsedData = new String[flightData.length][7];

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

    if (i == 0) { //fill the first flightNodesTwoWay slot
      flightNodesTwoWay[0] = flightHolder;
    }
    else if (i > 0) {
      boolean flightEqualFlag = false;
      for (int a=0; a<flightNodesTwoWay.length; a++) {
        if (flightNodesTwoWay[a].isNodeEqual(flightHolder)) {
          flightNodesTwoWay[a].addPass(flightHolder);
          flightEqualFlag = true;
          break;
        }
      }
      if (!flightEqualFlag) {
        flightNodesTwoWay = (FlightNode[])append(flightNodesTwoWay, flightHolder);
      }
    }
  }
  for (int i=0; i<flightNodesTwoWay.length; i++) {
    if (i == 0) {
      flightNodesTotal[0] = flightNodesTwoWay[0];
    }
    else {
      boolean flightEqualFlag = false;
      for (int o=0; o<flightNodesTotal.length; o++) {
        if (flightNodesTotal[o].isBetweenCountries(flightNodesTwoWay[i])) {
          flightNodesTotal[o].addPass(flightNodesTwoWay[i]);
          flightEqualFlag = true;
          break;
        }
      }
      if (!flightEqualFlag) {
        flightNodesTotal = (FlightNode[])append(flightNodesTotal, flightNodesTwoWay[i]);
      }
    }
  }

  for (int i=0; i<flightNodesTwoWay.length; i++) {
    if (flightNodesTwoWay[i].fromCountry.equals("USA") && flightNodesTwoWay[i].toCountry.equals("United Kingdom")) {
      println("\n" + "Node Count: " + i);
      flightNodesTwoWay[i].printFlightNode();
    }
    if (flightNodesTwoWay[i].fromCountry.equals("United Kingdom") && flightNodesTwoWay[i].toCountry.equals("USA")) {
      println("\n" + "Node Count: " + i);
      flightNodesTwoWay[i].printFlightNode();
    }
  }
  for (int i=0; i<flightNodesTotal.length; i++) {
    if (flightNodesTotal[i].fromCountry.equals("United Kingdom") && flightNodesTotal[i].toCountry.equals("USA")) {
      println("\n" + "Total Count: " + i);
      flightNodesTotal[i].printFlightNode();
    }
    if (flightNodesTotal[i].fromCountry.equals("USA") && flightNodesTotal[i].toCountry.equals("United Kingdom")) {
      println("\n" + "Total Count: " + i);
      flightNodesTotal[i].printFlightNode();
    }
  }
}
