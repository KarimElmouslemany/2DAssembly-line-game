public class Topping //start of class 
{
  int postionX_image, postionY_image; // declaring the member
  int image_width = 40; // declaring the member
  int image_height = 40; // declaring the member 
  PImage mushroom, olives, sauce,pepprion; // varibles of the image
  
  Topping(int postionX_image, int postionY_image) // constructor
  {
    this.postionX_image = postionX_image; // stores in member x.
    this.postionY_image = postionY_image; // stores in member y.
    sauce = loadImage("sauce.png"); // loads the image from the location its saved at
    mushroom = loadImage("Mushroom.png"); // loads the image from the location its saved at
    olives = loadImage("olives.png");// loads the image from the location its saved at
    pepprion = loadImage("Pepperoni.png"); // loads the image from the location its saved at
  }

  int postion_im_X() { // get postion method 
    return this.postionX_image; // return the member 
  }

  int postion_im_Y() {  // get postion method 
    return this.postionY_image; // return the member 
  } 
}
