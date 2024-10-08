public class Sauce extends Topping // declares that Topping is a sub class of Sauce class
{
  boolean placed = false; // boolean for if the suace has been placed 

  Sauce(int x, int y) // constructor
  {
    super(x, y); // super varible
  }
  
  void render() // function for render
  {
    image(sauce, postionX_image, postionY_image);// image
    sauce.resize( image_width, image_height); // resizeing the image
  }
}
