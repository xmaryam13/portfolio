class PhoneUsage {
  
  // info about each apps session
  String date;
  String app;
  String category;
  int duration;
  String timeOfDay;
  
  // creating a new object
  PhoneUsage(String date, String app, String category, int duration, String timeOfDay) {
    this.date = date;
    this.app = app;
    this.category = category;
    this.duration = duration; 
    this.timeOfDay = timeOfDay;
  }
  
  // display app sessions as a circle 
  void display(int index, color dotColour) {
    
    int column = index % 10;
    int row = index / 10;
    
    float x = 90 + column * 88;
    float y = 170 + row * 48;
    
    float circleSize = map(duration, 1, 60, 12, 38);
    
    fill(dotColour);
    noStroke();
    ellipse(x, y, circleSize, circleSize);
  }

}
