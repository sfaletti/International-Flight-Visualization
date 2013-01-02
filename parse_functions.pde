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

