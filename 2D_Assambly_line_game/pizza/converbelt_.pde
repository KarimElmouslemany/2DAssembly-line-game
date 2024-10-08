class Convyer // start of class //<>//
{
  float rectangleX, rectangleY, rectangle_width, rectangle_height; //  declaring the members

  Convyer(float rectangleX, float rectangleY, float rectangle_width, float rectangle_height) // constructor
  {
    this.rectangleX =rectangleX;  // stores in member rectangleX.
    this.rectangleY = rectangleY; // stores in member rectangleY.
    this.rectangle_width = rectangle_width; // stores in member rectangle_width.
    this.rectangle_height= rectangle_height; // stores in member rectangle_height.
  }

  void convyerebelt() // a function for the convyer belt
  {
    fill(128, 128, 128); // fill the colouer of the convyer belt with white
    rect(rectangleX, rectangleY, rectangle_width, rectangle_height); // draws the convyer
  }

  void update_convyer() // method update
  {
    convyerebelt(); // conveyer belt function.
  }
} // end of class 
