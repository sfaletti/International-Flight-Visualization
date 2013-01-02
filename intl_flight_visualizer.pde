String[] flightData;
String[][] parsedData;
FlightNode[] flightNodesTwoWay = new FlightNode[1];
FlightNode[] flightNodesTotal = new FlightNode[1];

String[] flightCountries;
String[][] splitCountries;
CountryNode[] countryNodes = new CountryNode[0];

int maxWeight = 0;

String countryName = "United States";
ArrayList countries = new ArrayList();

void setup() {
  size(800, 600, P2D);
  background(255);
  parseCountryData();
  countries = makeCountryList(countryName);
}

void draw() {
  background(255);
  pushStyle();
  fill(255, 50, 50);
  textSize(20);
  textAlign(LEFT, TOP);
  text(countryName, 5, 5);
  popStyle();
  boolean textFlag = false;
  String flagText = new String();
  float nodeX = 0;
  float nodeY = 0;
  pushMatrix();
  translate(width/2, height/2);
  pushStyle();
  stroke(0);
  fill(255, 0, 0);
  ellipse(0, 0, 15, 15);
  popStyle();
  rotate(PI);
  for (int i=0; i<countries.size(); i++) {
    pushMatrix();
    CountryNode country = (CountryNode)countries.get(i);
    rotate((TWO_PI/countries.size())*i);
    translate(0, map(country.weight, 0, maxWeight, (height/2)-40, 40));
    if (dist(mouseX, mouseY, modelX(0, 0, 0), modelY(0, 0, 0)) < 5) {
      nodeX = modelX(0, 0, 0);
      nodeY = modelY(0, 0, 0);
      fill(0);
      textFlag = true;
      flagText = nfc(country.weight) + "\n" + country.country2;
    }
    else {
      fill(200);
    }
    noStroke();
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
  popMatrix();
  if (textFlag) {
    pushStyle();
    fill(0);
    textSize(15);
    ellipse(nodeX, nodeY, 15, 15);
    text(flagText, nodeX+10, nodeY+10);
    popStyle();
  }
}


ArrayList makeCountryList(String _country) {
  ArrayList chosenCountries = new ArrayList();
  for (int i=0; i<countryNodes.length; i++) {
    if (countryNodes[i].country1.equals(_country)) {
      chosenCountries.add(countryNodes[i]);
      countryNodes[i].printCountryNode();
      if (countryNodes[i].weight > maxWeight) {
        maxWeight = countryNodes[i].weight;
      }
    }
  }
  println(chosenCountries.size());
  println("maxWeight: " + maxWeight);
  return chosenCountries;
}

