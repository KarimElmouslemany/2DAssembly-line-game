public class Pizza // start of class
{
  int circuleX; // declaring the members
  float circuleY; // declaring the members
  int circule_size; // declaring the members
  float speed = 1; // declaring the members
    int loops = 0;
  PImage pizzas; // varaible for the image pizza.
  boolean mushroomPlaced = false; // boolean for mushroom
  boolean olivesPlaced = false; // boolean for olives
  boolean saucePlaced = false; // boolean for suace
  Mushroom top; // declares a class varaible 
  Olives top2; // declares a class varaible 
  Sauce top3; // declares a class varaible 

  Pizza(int circuleX, float circuleY, int circule_size) // constructore
  {
    this.circuleX = circuleX;  // stores in member circuleX.
    this.circuleY = circuleY; // stores in member circuleY.
    this.circule_size = circule_size; // stores in member circule_size.
    pizzas = loadImage("pizza.png"); // loades the image pizza
  }

  void drawPizza() // a function for pizza
  {
    image(pizzas, circuleX, circuleY); // making the object
    pizzas.resize(circule_size, circule_size); // resizes the image pizza
  }

  void go_back()
  {
    if ( circuleX < 0) // if the pizza is less than 0 then image goes to postion x 700.
    {
      circuleX=700; // cricule x  postion goes to the beiggneing of the convyerbelt
      loops = loops + 1;
    }
  }

void drawToppings()
  {
    if (saucePlaced) // if the suace booelan is true then suace gets renderd 
    {
      top3.render(); // renders the suace from class suace 
    }

    if (mushroomPlaced) // if the mushroom booelan is true then suace gets renderd 
    {
      top.render(); // renders the suace from class mushroom
    }

    if (olivesPlaced) // if the olives booelan is true then suace gets renderd 
    {
      top2.render(); // renders the suace from class olives
    }
  }

  void update() //method for updating everything
  {
    circuleX -= speed; // moves the pizza by subtraction  1
    go_back(); // method
    drawPizza(); // method
    drawToppings(); // method
  }

  boolean Collision(Topping topping)
  {
    int hitboxSize = 20;
    boolean xCollision = topping.postion_im_X() > circuleX - hitboxSize / 2 && topping.postion_im_X() < circuleX + hitboxSize / 2; // calculate the X of topping and pizza
    boolean yCollision = topping.postion_im_Y() > circuleY - hitboxSize / 2 && topping.postion_im_Y() < circuleY + hitboxSize / 2; // calculate the Y of topping and pizza
    return xCollision && yCollision; // returns the collison as true or false.
  }
  
  int postion_c_X() { // get postion method 
    return this.circuleX; 
  }
  float postion_c_Y() {  // get postion method 
    return this.circuleY; 
  }
  float size_circule() {  // get postion method 
    return this.circule_size; 
  }
  float speed_add() {  // get postion method 
    return this.speed;  // return the member 
  }
} // end of class
