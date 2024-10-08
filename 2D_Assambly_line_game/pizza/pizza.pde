ArrayList<Pizza>pizza1 = new ArrayList<Pizza>(); // creat array list //<>//
ArrayList<Mushroom>mushroom = new ArrayList<Mushroom>(); // creat array list
ArrayList<Olives>olives = new ArrayList<Olives>(); // creat array list
ArrayList<Sauce>sauce = new ArrayList<Sauce>(); // creat array list
ArrayList<Peporion>pepperoni = new ArrayList<Peporion>();  // creat array list
Convyer mover; // declaring a varaible for the class convyer belt.
Topping topping_caller; // varaible for the class Topping.
float number_of_pizza = 1;// the number of pizzas.
int number_of_mushroom = 1; // the number of mushrooms.
int number_of_olives = 1; // the number of olives.
int number_of_suace = 1; // the number of suaces.
int number_of_pep = 1; // the number of peprione.
int score_mush; // variable for the score of mushroom
int score_ol; // variable for the score of olives
int score_su; // variable for the score of suace
int score_pep =0; // variable for the score of peproine
int final_score; // add up all the scores for all the toppings 
PImage game_over, game_won; // varibles for the image
Pizza pizza_caller; // declares a varaible class for the pizza class
Mushroom mushroom_p;  // declares a varaible class for the mushroom class
Olives olives_p;  // declares a varaible class for the olives class
Sauce suace_p;  // declares a varaible class for the sauce class
Peporion peporion_p; // declaring a  variable class for peporion
int conter_number_toppings; //  varaible for the number of topping
int conter_suace =  number_of_suace ; /// varaible for counting  the number of suaces
int conter_mushroom =  number_of_mushroom; // varaible for counting  the number of mushroom
int conter_olives = number_of_olives; // varaible for counting the  number of olives
int conter_pep =number_of_pep; // varaible for counting the number of peporion
int numbers_topping_all_toaghter = number_of_suace + number_of_mushroom + number_of_olives+number_of_pep;
int checker_if_lost = 0; // varaible for checking the excution of the game over screen.
int checker_if_won = 0; // varaible for checking the excution of the win screen.
boolean captured = false; // boolean varaible
boolean sauceCaptured = false;  // boolean varaible
boolean oliveCaptured = false;  // boolean varaible
boolean mushroomCaptured = false;  // boolean varaible
boolean  suaceCaptured = false;  // boolean varaible
boolean peporionCaptured = false; // boolean varaible
void setup()
{
  size(700, 500); // determnes the size of the canves
  mover = new Convyer(0, 440, 700, 50); // inputting info for the object and declares the varibles to the class
  topping_caller = new Topping(0, 0); // inputting info for the object and declares the varibles to the class
  pizza_caller = new Pizza(0, 0, 0); // inputting info for the object and declares the varibles to the class
  creatpizza(); // calls the creating pizza.
  creatmushroom();//calls the creating mushroom.
  creat_olives(); //calls the creating olives.
  creat_suace();  //calls the creating suace.
  creatpep(); // calls the creating peproine
}

void draw()
{
  background(200); // background of the canves.
  imageMode(CENTER);// puts the image in the center when it goes on the pizza
  mover.update_convyer(); // calls the function.
  move(); //  calls the function move.this function moves the pizzas.
  get_suace();// calls the function
  get_mushroom(); // calls the function
  get_olives();// calls the function
  dragging();// calls the function
  collison();// calls the function
  endgame(); // calls the function
  Random_topping_appers(); // calls the function
  if (checker_if_won > 0) // if checker_if_won is greater than 0 then excuet the code in the if statment
  {
    Image_of_gamewon(); // calls the function 
  }
  if (checker_if_lost > 0) // if checker_if_lost is greater than 0 then excuet the code in the if statment
  {
    Image_of_gameOver(); // calls the function
  }
  fill(255, 0, 0); // makes the text score red. 
  textSize(20); // changes text size to 20.
  text("Score: " +  final_score, 10, 20); // puts it at postion 10,20 and shows the over all score on the canves 

  if (pizza_caller.loops > 0) // if varaible loop is greater than 0 than excute the code in the if statment 
  {
    get_pep(); // calls the function
  }
}

void dragging() // function
{
  if (mousePressed && topping_caller != null) // if the mouse is pressed then excuet the code in the if statment.
  {
    topping_caller.postionX_image = mouseX;//change image position to mouse position
    topping_caller.postionY_image = mouseY; //change image position to mouse position
  }
}

void mousePressed()
{
  for (int i = 0; i<number_of_mushroom && captured == false; i++) // loops the number of mushroom
  {
    if ( dist(mouseX, mouseY, mushroom.get(i).postionX_image, mushroom.get(i).postionY_image) < mushroom.get(i).image_width/2 && captured == false)//mouse is inside the image
    {
      captured = true; // when mouse is pressed then captured becomes true.
      mushroomCaptured = true; // when mushroom is slected then it become true
      topping_caller = mushroom.get(i); //  topping_calle becomes get method
      break; // breaks from the for loop when everything is true. 
    }
  }
  for ( int i=0; i< number_of_olives && captured == false; i++) // loops the number of olives wanted
  {
    if ( dist(mouseX, mouseY, olives.get(i).postionX_image, olives.get(i).postionY_image) < olives.get(i).image_width/2 && captured == false)//mouse is inside the image
    {
      captured = true; // when mouse is pressed then captured becomes true.
      oliveCaptured = true; // when olives is selected then it becomes true.
      topping_caller = olives.get(i);  //  topping_caller becomes get method
      break; // breaks from the for loop. when everything is true.
    }
  }
  for (int i=0; i< number_of_suace && captured == false; i++) // loops the number of suaces wanted
  {
    if ( dist(mouseX, mouseY, sauce.get(i).postionX_image, sauce.get(i).postionY_image) < sauce.get(i).image_width/2 && captured == false)//mouse is inside the image
    {
      captured = true; // when mouse is pressed then captured becomes true.
      sauceCaptured = true; // when suace is selected then it becomes true
      topping_caller = sauce.get(i); //  topping_caller becomes get method
      break; // breaks from the for loop. when everything is true
    }
  }
  for (int i =0; i <number_of_pep &&  captured == false; i++)  // loops the number of peprione  wanted
  {
    if (dist(mouseX, mouseY, pepperoni.get(i).postionX_image, pepperoni.get(i).postionY_image) < pepperoni.get(i).image_width/2 && captured == false) //mouse is inside the image
    {
      captured = true; // when mouse is pressed then captured becomes true.
      peporionCaptured = true; // when suace is selected then it becomes true
      topping_caller = pepperoni.get(i); //  topping_caller becomes get method
      break; // breaks from the for loop. when everything is true
    }
  }
}

void mouseReleased()
{
  topping_caller = null; // if the mouse is released  then topping caller will be null. 
  captured = false; // if the mouse is released  then captured will go back to false and stay on the pizza
  mushroomCaptured = false; // if the mouse is released then mushroomCaptured will go back to false and stay on the pizza
  oliveCaptured = false; // if the mouse is released then olivesCaptured will go back to false and stay on the pizza
  peporionCaptured = false; // if the mouse is released then peporionCaptured will go back to false and stay on the pizza
  suaceCaptured = false;  // if the mouse is released then suaceCaptured will go back to false and stay on the pizza
}

void creatpizza()
{
  // Add pizzas to the ArrayList
  for ( int i =0; i<number_of_pizza; i++) // loops the number of pizzas
  {
    Pizza pizza = new Pizza(700+100*i, 465, 50);
    pizza1.add(pizza);  // creats the pizzas.
  }
}

void creatmushroom()
{
    // Add mushroom to the ArrayList
  for (int i = 0; i<number_of_mushroom; i++) // loops the number of mushroom
  {
    mushroom.add(new Mushroom(width/2+30*i, 250));// creats a new mushroom.
  }
}

void get_mushroom()
{
  for (int i=0; i<number_of_mushroom; i++) // loops the number of mushroom
  {
    Mushroom m = mushroom.get(i); // gets the mushroom from the class mushroom
    if (m.placed == false) // if the mushroom is not placed
    {
      m.render(); // renders the mushroom on the screen
    }
  }
}
void creatpep()
{
      // Add Peporion to the ArrayList
  for ( int i =0; i<number_of_pep; i++) // loops through the number of pepperoni
  {
    pepperoni.add(new Peporion(width/2+50*i, 200)); // creates  a new peprione 
  }
}
void move()
{
  for (int i =0; i<number_of_pizza; i++) // loops the number of pizzas
  {
    Pizza p = pizza1.get(i); // getting the pizza from the array.
    p.update();  // moves the pizza.
  }
}
void get_pep()
{
  for (int i =0; i < pepperoni.size(); i++) // makes a for loop
  {
    Peporion p = pepperoni.get(i); // getting the peprione from the array.
    if (p.placed == false) // if the pepperoni is not placed.
    {
      p.render();  // renders the peprion  on the screen.
    }
  }
}
void creat_olives()
{
  // Add olives to the ArrayList
  for ( int i=0; i< number_of_olives; i++) // loops the number of olives wanted.
  {
    olives.add(new Olives(width/2+30*i, 150)); // creats a new olives.
  }
}

void get_olives()
{
  for (int i =0; i < number_of_olives; i++) // creats a  certine amount of olives every time
  {
    Olives o = olives.get(i); // gets a new olives every time from the array. 
    if (o.placed == false) // if the olives is not placed.
    {
      o.render(); // draws the olives on the screen.
    }
  }
}

void creat_suace()
{
  // Add sauce to the ArrayList
  for (int i =0; i < number_of_suace; i++) // loops the number of suaces wanted
  {
    sauce.add(new Sauce(width/2+30*i, 60)); // creates  a new sauce
  }
}

void get_suace()
{
  for (int i=0; i< number_of_suace; i++) // loops the number of suaces wanted
  {
    Sauce s = sauce.get(i); // gets the suace image from the array
    if (s.placed == false)  // if the suace is not placed
    {
      s.render(); // calls  the render function for suace
    }
  }
}

void collison()
{
  for ( int p =0; p < pizza1.size(); p++) // for loop for the pizza
  {
    for ( int m =0; m < mushroom.size(); m++) // for loop for the mushroom
    {
      if (pizza1.get(p).Collision(mushroom.get(m)))// if the topping collide then execute the code.
      {
        mushroom.get(m).postionX_image = pizza1.get(p).postion_c_X();// if the x posstion of topping and pizza are the same then topping stays on the pizza

        if (mushroom.get(m).postion_im_X() <= 0) // if the the postion of  the image is less than 0. the  score is added and image postion goes to (-5,-20).
        {
          conter_mushroom = conter_mushroom - 1;  // if the topping gets to zero then the topping will taken away from the conter
          mushroom.get(m).placed = true; //  if mushroom is near the end and is placed on pizza then it will equal true.
          score_mush++; // adds the score
          mushroom.get(m).mushroom = null; // makes the image remove from memory 
          mushroom.get(m).postionY_image = -5; // mushroom Y postion goes to a diffrent postion on the canves
          mushroom.get(m).postionX_image = -20; // mushroom X postion goes to a diffrent postion on the canves
        }
      }
    }
    for ( int o =0; o < olives.size(); o++) // for loop for the olives
    {
      if (pizza1.get(p).Collision(olives.get(o)))// if the topping collide then execute the code.
      {
        olives.get(o).postionX_image = pizza1.get(p).postion_c_X(); // if the x posstion of toopping and pizza are the same then topping stays on the pizza
        if (olives.get(o).postion_im_X() <= 0)   // if the the postion of  the image is less than 0 or equale to 0.excute the code in the if statement. 
        {
          conter_olives = conter_olives - 1; // if the topping gets to zero then the topping will taken away from the conter
          olives.get(o).placed = true; // if olivies is near the end and is placed on pizza then it will equal true.
          score_ol++; // adds the socre
          olives.get(o).olives = null; // makes the image remove from memory 
          olives.get(o).postionY_image = -5; // olives Y postion go to a diffrent postion on canves
          olives.get(o).postionX_image = olives.get(o).postionX_image-20; // olives X postion  go to a diffrent postion on the canves
        }
      }
    }
    for (int s =0; s < sauce.size(); s++) // for loop for the suace
    {
      if (pizza1.get(p).Collision(sauce.get(s))) // if the topping collide then execute the code.
      {
        sauce.get(s).postionX_image = pizza1.get(p).postion_c_X(); // if the x posstion of topping and pizza are the same then topping stays on the pizza
        if (sauce.get(s).postion_im_X() <= 0)   // if the the postion of  the image is less than 0 or equale to 0.excute the code in the if statement. 
        {
          conter_suace = conter_suace  -1;  // if the topping gets to zero then the topping will taken away from the conter
          sauce.get(s).placed = true; // if suace  is near the end and is placed on pizza then it will equal true.
          score_su++; // adds the scoure to suace when is at the end of the convyer belt.
          sauce.get(s).sauce = null; // makes the image remove from memory 
          sauce.get(s).postionY_image = -5; // suace Y postion goes  to a diffrent postion on the canves.
          sauce.get(s).postionX_image = -20; // suace goes  to a diffrent postion on canves.
        }
      }
    }
    for ( int r = 0; r<pepperoni.size(); r++)
    {
      if (pizza1.get(p).Collision(pepperoni.get(r))) // if the topping collide then execute the code.
      {
        pepperoni.get(r).postionX_image = pizza1.get(p).postion_c_X();
        if (pepperoni.get(r).postion_im_X() <= 0)   // if the the postion of  the image is less than 0 or equale to 0.excute the code in the if statement. 
        {
          conter_pep = conter_pep - 1; // if the topping gets to zero then the topping will taken away from the conter
          pepperoni.get(r).placed = true; // if suace  is near the end and is placed on pizza then it will equal true.
          score_pep++; // adds the scoure to suace when is at the end of the convyer belt.
          pepperoni.get(r).pepprion = null;  // makes the image remove from memory 
          pepperoni.get(r).postionY_image = -5; // suace Y postion goes  to a diffrent postion on the canves.
          pepperoni.get(r).postionX_image = -20; // suace goes  to a diffrent postion on canves.
        }
      }
    }
    // Render toppings only if they are not placed
    for (int i = 0; i < mushroom.size(); i++) // loops through the mushroom
    {
      if (!mushroom.get(i).placed) // if the topping is not placed
      {
        mushroom.get(i).render(); // renders the topping
      }
    }

    for (int i = 0; i < olives.size(); i++) // loops through the olives
    {
      if (!olives.get(i).placed) // if the topping is not placed
      {
        olives.get(i).render();  // renders the topping
      }
    }

    for (int i = 0; i < sauce.size(); i++) // loops through the suace
    {
      if (!sauce.get(i).placed) // if the topping is not placed
      {
        sauce.get(i).render(); // renders the topping
      }
    }
  }// end of the for loop pizza
  final_score = score_mush + score_ol + score_pep + score_su; // adds the scores of all the topping into the  a vraible final_score. 
}// end of the method

void Random_topping_appers()
{
  if (pizza_caller.circuleX < width/2) // if the posstion x of the pizza is less than width/2 then we excute the code in the if statement 
  {
    get_pep(); // calls function 
  }
}
void Image_of_gameOver() {
  game_over = loadImage("GameOver.jpg");  // loads the image from the location its saved at
  imageMode(CENTER); // Set image mode to CENTER
  image(game_over, width / 2, height / 2, width, height); // Draw the image at the center of the canvas and set its size to cover the entire canvas
}
void Image_of_gamewon() {
  game_won = loadImage("you_win.jpg");  // loads the image from the location its saved at
  imageMode(CENTER); // Set image mode to CENTER
  image(game_won, width / 2, height / 2, width, height); // Draw the image at the center of the canvas and set its size to cover the entire canvas
}
void endgame()
{
  for ( int p =0; p<pizza1.size(); p++) // loops the number of pizza 
  {
    for ( int t =0; t<mushroom.size(); t++) // loops the number of mushroom 
    {
      pizza_caller = pizza1.get(p); // assigning the pizza class varaible the get methode.

      conter_number_toppings = conter_mushroom + conter_olives + conter_suace + conter_pep ; // adds all th the topping that are remmaning

      if (pizza1.get(p).postion_c_X() != mushroom.get(t).postion_im_X()
        && pizza1.get(p).postion_c_X() != olives.get(t).postion_im_X()
        &&pizza1.get(p).postion_c_X() != sauce.get(t).postion_im_X() && pizza1.get(p).postion_c_X() == 0) // if topping is not on pizza and has gone to the end. then excute the code in the if statement
      {

        if (conter_number_toppings ==  numbers_topping_all_toaghter) // if the number of toppings have not gone down then the code in the if statement will excuet.
        {
          pizza_caller.speed =0; // the pizza will stop moving
          mousePressed = false; // sets mousePressed to false
          captured = true; // sets captured to false
          mushroomCaptured = true; // set  mushroomCaptured to false
          oliveCaptured = true; // set olivesCaptured to false
          sauceCaptured = true; // set sauceCaptured to false
          checker_if_lost = checker_if_lost + 1; // adds one to checker_if_lost
        } else
        {
          if (conter_number_toppings == 2 || conter_number_toppings == 3 ) // if conter number is equal to  2 or 3 then speed should go to zero.
          {
            pizza_caller.speed =0; // the pizza will stop moving
            checker_if_lost = checker_if_lost + 1; // adds one to checker
          }
          if (conter_number_toppings ==0) // if the number of topping gone to zero then the code in the if statement will be excuted.
          {
            checker_if_won=checker_if_won+1;  // adds one to checker_if_won
          }
        }
      }
    }
  }
}
