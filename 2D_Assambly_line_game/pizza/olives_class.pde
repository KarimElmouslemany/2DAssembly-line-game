public class Olives extends Topping // start of class and  declares that Topping is a sub class of olives class
{
  boolean placed = false; // boolean for if the olives  has been placed 

  Olives(int x, int y) // constructor 
  {
    super(x, y); // super varible
  }
  
  void render() // method for rendering the images 
  {

    image(olives, postionX_image, postionY_image);// image
    olives.resize(image_width, image_height); // resizeing the image
  }
} // end of class
