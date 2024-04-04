class Strip
{
  private int x;
  private float lengthSide;
  private ArrayList<Mesh> listMesh;
  private float scale;
  private float coordX, coordY;
  
  public int getX(){return x;}
  public float getLengthSide(){return lengthSide;}
  public ArrayList<Mesh> getListMesh(){return listMesh;}
  
  public Strip(int _x, float _lengthSide, float _scale)
  {
    x = _x;
    lengthSide = _lengthSide;
    scale = _scale;
    coordX = 0;
    coordY = 0; 
    listMesh = new ArrayList<Mesh>();
  }
  
  public Strip(int _x, float _lengthSide, float _scale, float _coordX, float _coordY)
  {
    x = _x;
    lengthSide = _lengthSide;
    scale = _scale;
    coordX = _coordX;
    coordY = _coordY;
    listMesh = new ArrayList<Mesh>();
  }
  
  
  public void InitStrip()
  {
    int idSommet = 1;
    float r = 0;
    float step = 0.005;
    for(int i = 1; i <= x; i++)
    {
      for(int j = 1; j <= x; j++)
      {
        Sommet s2, s3, s4, s5;
        s2 = new Sommet(Integer.toString(idSommet  + 1),lengthSide * (j), lengthSide * (i - 1), noise((float(j) - coordX) * scale, coordY + ( float(i) - 1) * scale) * 5000);
        s3 = new Sommet(Integer.toString(idSommet + 2),lengthSide * j, lengthSide * i  , noise((float(j) - coordX) * scale, coordY + float(i) * scale) * 5000);
        s4 = new Sommet(Integer.toString(idSommet + 3),lengthSide * (j - 1), lengthSide * i, noise( (float(j) - 1  - coordX) * scale, coordY + float(i) * scale) * 5000);        
        s5 = new Sommet(Integer.toString(idSommet + 4),lengthSide * (j - 0.5), lengthSide * (i - 0.5), noise((float(j) - 0.5  - coordX) * scale, coordY + (float(i) - 0.5) * scale) * 5000);        
        if (i == 1 && j == 1)  // premier mesh
        {
          Sommet s1 = new Sommet(Integer.toString(1),lengthSide * (j - 1),lengthSide *(i - 1), noise((float(i) - coordX) * scale, coordY + float(j) * scale) * 5000);
          listMesh.add(createMesh(s1, s2, s3, s4, s5));
          idSommet += 4;
        }
        else if (i == 1)  // première rangée, on récupère les deux sommets du mesh précédent et on crée les deux sommets suivants
        {
          Mesh mesh = listMesh.get(listMesh.size() - 1);
          Sommet NewS1 = mesh.getListFace().get(1).getListSommet().get(0);
          Sommet NewS4 = mesh.getListFace().get(1).getListSommet().get(1);
          listMesh.add(createMesh(NewS1, s2, s3, NewS4, s5));
          idSommet += 3;
          if (j == x) idSommet --;
        }
        else if ( j == 1 )  // première colonne, on récupère les deux sommets du mesh précédent et on crée les deux sommets suivants.
        {
          Mesh mesh = listMesh.get(listMesh.size() - x);
          Sommet NewS1 = mesh.getListFace().get(2).getListSommet().get(1);
          Sommet NewS2 = mesh.getListFace().get(1).getListSommet().get(1);
          listMesh.add(createMesh(NewS1, NewS2, s3, s4, s5));
          idSommet += 3;
          
        }
        else  // le dernier mesh a crée, on récupère les deux sommets du mesh précédent et le sommet du mesh positionné au dessus et on crée le sommet suivant.
        {         
          Mesh mesh1 = listMesh.get(listMesh.size() - x);
          Mesh mesh2 = listMesh.get(listMesh.size() - 1);
          Sommet NewS1 = mesh2.getListFace().get(1).getListSommet().get(0);          
          Sommet NewS2 = mesh1.getListFace().get(1).getListSommet().get(1);
          Sommet NewS4 = mesh2.getListFace().get(1).getListSommet().get(1); 
          listMesh.add(createMesh(NewS1, NewS2, s3, NewS4, s5));  
          idSommet ++;
        }
        r += step;

      }
    }
  }
  
  
  
  
  public Mesh createMesh(Sommet s1, Sommet s2, Sommet s3, Sommet s4)
  {
      Face f1 = new Face(s1, s2, s4);
      Face f2 = new Face(s2, s3, s4);
      ArrayList<Face> listFace = new ArrayList<Face>();
      listFace.addAll(Arrays.asList(f1, f2));
      for(Face face : listFace) face.CreateShape();
      Mesh mesh = new Mesh(listFace);
      return mesh;
  }
  
  public Mesh createMesh(Sommet s1, Sommet s2, Sommet s3, Sommet s4, Sommet s5)
  {
      Face f1 = new Face(s1, s2, s5);
      Face f2 = new Face(s2, s3, s5);
      Face f3 = new Face(s3, s4, s5);
      Face f4 = new Face(s4, s1, s5);

      ArrayList<Face> listFace = new ArrayList<Face>();
      listFace.addAll(Arrays.asList(f1, f2, f3, f4));
      for(Face face : listFace)
      {
        face.CreateShape();
      }
      Mesh mesh = new Mesh(listFace);
      return mesh;
  }
  
  public void drawStrip()
  {
    if(!listMesh.isEmpty())
    {
      for(Mesh mesh : listMesh)
      {
        mesh.drawMesh();
      }
    }
  }
  
  public float getStripLenght(){ return lengthSide * x;}
  
}
