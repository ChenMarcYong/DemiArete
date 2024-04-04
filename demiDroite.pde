import java.util.ArrayList;
import java.util.Arrays;

boolean showName = false;
boolean refresh = true;

int nbMesh = 15;
float lenghtMesh = 200;
//float scale = 0.075;
int _width = 1080;  
int _height = 720;  

float translateX = - nbMesh * (lenghtMesh / 2f) + _width/2f;
float translateY = 550;
float translateZ = - nbMesh * lenghtMesh * 0.9;

int random = int(random(0, 100000));
void setup()
{
  background(100);
  size(_width, _height, P3D);
  //listFace.addAll(Arrays.asList(f1, f2, f3, f4)); 
  //object = new Mesh(listFace);
  //object.doAdjacentFace();
  println(millis());
  strip.InitStrip();
  println(millis());
  //chunk.initChunk();  
  println(millis());
  //println(strip.getX() * strip.getLengthSide() / 2f);
  frameRate(100);
  noiseSeed(random);
  
}

void draw() 
{
  background(0);
  
  pushMatrix();
  //rotateY(angle);
  //object.drawMesh();
  translate(translateX, translateY, translateZ);
  rotateX(HALF_PI);
  strip.drawStrip();
  
  //chunk.DrawChunk();
  //shape(f1.getShape());
  //for (Sommet sommet : f1.getListSommet()) sommet.ShowName();
  popMatrix();
  
  move();
  
  //for(char c : touchesPressed) print(c);
  //println(frameRate);
}
