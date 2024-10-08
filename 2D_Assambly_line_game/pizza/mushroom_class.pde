public class Mushroom extends Topping // start of class  and  declares that Topping is a sub class of mushroom class
{
  boolean placed = false; // boolean for if the mushroom has been placed 

  Mushroom(int x, int y) // constructor 
  {
    super(x, y); // super varible
  }
  
  void render() // method for rendering the images 
  {
    image(mushroom, postionX_image, postionY_image);//image
    mushroom.resize(image_width, image_height); // resizeing the image
    
  }
}// end of class 
