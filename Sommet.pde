class Sommet
{
  private float x, y, z;
  private String name;
  
  public String getName() {return name;};
  public float getX() {return x;}
  public float getY() {return y;}
  public float getZ() {return z;}
  
  
  
  
  public Sommet(String _name, float _x, float _y, float _z)
  {
    name = _name;
    x = _x;
    y = _y;
    z = _z;
  }
  
  public Sommet(float _x, float _y, float _z)
  {
    name = null;
    x = _x;
    y = _y;
    z = _z;
  }

  
  public void ShowName()
  {
    float meanX, meanY, meanZ;
    textSize(32);
    fill(255, 0, 0);
    text(name, getX(), getY() + 20, getZ());
    noFill();
  }
 
}
