class HalfEdge
{
  private Sommet origin;
  private HalfEdge next;
  private HalfEdge previous;
  private HalfEdge opposite;


  public Sommet getOrigin(){return origin;}
  public HalfEdge getNext(){return next;}
  
  public HalfEdge(Sommet _origin)
  {
    origin = _origin;
  }
  
  public HalfEdge(Sommet _origin, HalfEdge _next)
  {
    origin = _origin;
    next = _next;
    next.previous = this;

  }
  
  public void addNext(HalfEdge _next)
  {
    next = _next;
    next.previous = this;
  }
  
  public void addOpposite(HalfEdge _opposite){opposite = _opposite;}

 
  /*public void AttributeOpposite(Sommet s)
  {
    if (origin == s.next.origin)
    
  }*/

  public void drawHalfEdge()
  {
    pushMatrix();
    textSize(16);
    fill(0, 255, 0);
    
    line(origin.getX(), origin.getY(), origin.getZ(), next.origin.getX(), next.origin.getY(), next.origin.getZ());
    popMatrix();
  }
}
