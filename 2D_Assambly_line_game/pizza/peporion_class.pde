public class Peporion extends Topping // declares that Topping is a sub class of Peporion  class
{
  boolean placed = false; // boolean for if the mushroom has been placed 

  Peporion(int x, int y) // constructor 
  {
    super(x, y); // super varible
  }
  
  void render() // method for rendering the images 
  {
    image(pepprion, postionX_image, postionY_image);//image
    pepprion.resize(image_width, image_height); // resizeing the image
  }
 
} // end of class 
