
ArrayList<PhoneUsage> observations;


void setup() {

  size(1000, 800);

  // Create a list to store our phone usage objects
  observations = new ArrayList<PhoneUsage>();

  // Load the CSV file
  Table data = loadTable("observations.csv", "header");

  // Check whether the CSV file was found
  if (data == null) {
    println("ERROR: Could not find observations.csv");
    exit();
  }

  // Read every row in the CSV file
  for (TableRow row : data.rows()) {

    String date = row.getString("date");
    String app = row.getString("app");
    String category = row.getString("category");
    int duration = row.getInt("duration");
    String timeOfDay = row.getString("timeOfDay");

    // Create a PhoneUsage object
    PhoneUsage usage = new PhoneUsage(
      date, app, category, duration, timeOfDay
    );

    // Add the object to our list
    observations.add(usage);
  }

  println("Total observations: " + observations.size());

}


void draw() {

  background(250, 247, 240);

  // Main heading
  fill(40);
  textAlign(CENTER);
  textSize(28);
  text("My Digital Footprint", width / 2, 45);

  textSize(14);
  fill(100);
  text("A visual record of my phone usage", width / 2, 75);

  // Display total number of observations
  textSize(16);
  fill(40);
  text("Total observations: " + observations.size(),
       width / 2, 115);

  // Display every phone usage object
  for (int i = 0; i < observations.size(); i++) {

    PhoneUsage usage = observations.get(i);

    color dotColour = categoryColour(usage.category);

    usage.display(i, dotColour);
  }

  // Display the category legend
  drawLegend();

}


// Assign a colour to each app category
color categoryColour(String category) {
  
  // handle missing category values
  if (category == null) {
    return color(150); 
  }

  if (category.equals("Social Media")) {
    return color(230, 120, 140);
  }

  else if (category.equals("Communication")) {
    return color(100, 160, 220);
  }

  else if (category.equals("Entertainment")) {
    return color(170, 130, 210);
  }

  else if (category.equals("Music")) {
    return color(240, 190, 90);
  }

  else if (category.equals("Education")) {
    return color(110, 180, 140);
  }

  else {
    return color(150);
  }

}


// Draw the legend at the bottom of the sketch
void drawLegend() {

  String[] categories = {
    "Social Media",
    "Communication",
    "Entertainment",
    "Music",
    "Education"
  };

  float startX = 100;

  for (int i = 0; i < categories.length; i++) {

    float x = startX + i * 165;

    fill(categoryColour(categories[i]));
    noStroke();
    ellipse(x, 760, 13, 13);

    fill(50);
    textAlign(LEFT);
    textSize(11);
    text(categories[i], x + 12, 764);
  }

}
