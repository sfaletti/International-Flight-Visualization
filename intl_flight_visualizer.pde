String[] flightData;
String[][] parsedData;
FlightNode[] flightNodesTwoWay = new FlightNode[1];
FlightNode[] flightNodesTotal = new FlightNode[1];

String[] flightCountries;
String[][] splitCountries;
CountryNode[] countryNodes = new CountryNode[0];

float counter = 0;
int maxWeight = 0;


void setup() {
  parseCountryData();  
  for (int i=0; i<countryNodes.length; i++) {
    if (countryNodes[i].country1.equals("United States")) {
      println(countryNodes[i].country1 + "," + countryNodes[i].country2 + "," + countryNodes[i].weight);
      counter++;
    }
  }
  println(counter);

  size(400, 400);
  background(255);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI);
  for (int i=0; i<countryNodes.length; i++) {
    if (countryNodes[i].country1.equals("China")) {
      fill(150);
      ellipse(0, map(countryNodes[i].weight, 0, 400, 100, 350), 10, 10);
//      pushMatrix();
      rotate(TWO_PI/counter);
//      popMatrix();
    }
  }
  popMatrix();
}

