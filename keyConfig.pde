ArrayList<Character> touchesPressed = new ArrayList<Character>();
float speed = 50;

void move()
{
  if (touchesPressed.contains('z'))
  {
    translateZ += speed;
  }
  
  if (touchesPressed.contains('s'))
  {
    translateZ -= speed;
  }
  if (touchesPressed.contains('e'))  translateY += speed;
  if (touchesPressed.contains('a'))  translateY -= speed;
  if (touchesPressed.contains('q'))  translateX += speed;
  if (touchesPressed.contains('d'))  translateX -= speed;
  
}


void keyPressed()
{
  //char button = key;
  if(!touchesPressed.contains(key)) touchesPressed.add(key);

  if(key == 'p')  println(translateX, translateY, translateZ);
  
  if(key == 'r' && refresh) 
  {
    random = int(random(0, 100000));
    noiseSeed(random);
    strip = new Strip(nbMesh, lenghtMesh, 0.075);
    strip.InitStrip();
  }

  if(key == 'n') showName = !showName;

} 

void keyReleased()
{
  if(touchesPressed.contains(key)) touchesPressed.remove(Character.valueOf(key));
}
