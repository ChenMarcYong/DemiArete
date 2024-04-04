class Face
{
  private String name;
  private ArrayList<Sommet> listSommet;
  private ArrayList<HalfEdge> listHalfEdge;
  private ArrayList<Face> listFaceAdjacent;
  private PShape shape;
  
  public String getName() {return name;}
  public ArrayList<Sommet> getListSommet(){return listSommet;}
  public ArrayList<HalfEdge> getListHalfEdge(){return listHalfEdge;}
  public ArrayList<Face> getListFaceAdjacent(){return listFaceAdjacent;}
  public PShape getShape(){return shape;}

  public Face(String _name, Sommet _s1, Sommet _s2, Sommet _s3)
  {
    name = _name;    
    listSommet = new ArrayList<Sommet>();
    listSommet.addAll(Arrays.asList(_s1, _s2, _s3));
    
    HalfEdge e1 = new HalfEdge(_s1);
    HalfEdge e2 = new HalfEdge(_s2);
    HalfEdge e3 = new HalfEdge(_s3);
    
    e1.addNext(e2);
    e2.addNext(e3);
    e3.addNext(e1);
    
    listHalfEdge = new ArrayList<HalfEdge>();
    listHalfEdge.addAll(Arrays.asList(e1, e2, e3));

    
    listFaceAdjacent = new ArrayList<Face>();
    

  }
  
  public Face(Sommet _s1, Sommet _s2, Sommet _s3)
  {
    name = null;    
    listSommet = new ArrayList<Sommet>();
    listSommet.addAll(Arrays.asList(_s1, _s2, _s3));
    
    HalfEdge e1 = new HalfEdge(_s1);
    HalfEdge e2 = new HalfEdge(_s2);
    HalfEdge e3 = new HalfEdge(_s3);
    
    e1.addNext(e2);
    e2.addNext(e3);
    e3.addNext(e1);
    
    listHalfEdge = new ArrayList<HalfEdge>();
    listHalfEdge.addAll(Arrays.asList(e1, e2, e3));

    
    listFaceAdjacent = new ArrayList<Face>();
    
  }
  
  public void CreateShape()
  {
    
    shape = createShape();
    shape.beginShape();
    
    if (listSommet.get(0).getZ() > 3000) shape.fill(200);   
    else shape.fill(150); 
    shape.vertex(listSommet.get(0).getX(), listSommet.get(0).getY(), listSommet.get(0).getZ()); 
    if (listSommet.get(1).getZ() > 3000) shape.fill(200);   
    else shape.fill(150); 
    shape.vertex(listSommet.get(1).getX(), listSommet.get(1).getY(), listSommet.get(1).getZ()); 
    if (listSommet.get(2).getZ() > 3000) shape.fill(200);
    else shape.fill(150);
    shape.vertex(listSommet.get(2).getX(), listSommet.get(2).getY(), listSommet.get(2).getZ()); 
    shape.endShape();
    noFill();
    
    //triangle(listSommet.get(0).getX(), listSommet.get(0).getY(), listSommet.get(0).getZ(), listSommet.get(1).getX(), listSommet.get(1).getY(), listSommet.get(1).getZ(), listSommet.get(2).getX(), listSommet.get(2).getY(), listSommet.get(2).getZ());
  }
  
  public void printAdj()
  {
    println("Face : ",name, "possède les sommets adjacent suivant :");
    for(Face face : getListFaceAdjacent()) println(" - ", face.getName());
  }
  
  public void printHe()
  {
    HalfEdge first = listHalfEdge.get(0);
    HalfEdge edge = listHalfEdge.get(0);
    
    boolean flag = false;
    println("La face :", name, "possède :");
    while(true)
    {
      if(flag && edge == first) break;
      println("- HalfEdge :", edge.origin.getName(), "a pour next", edge.next.origin.getName(), "et pour previous", edge.previous.origin.getName());
      edge = edge.next;
      flag = true;
    }
  }
}
