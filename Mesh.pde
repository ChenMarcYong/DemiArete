class Mesh
{
  private ArrayList<Face> listFace;
  
  public ArrayList<Face> getListFace(){return listFace;}
  
  public Mesh(){listFace = new ArrayList<Face>();}
  public Mesh(ArrayList<Face> _listFace) {listFace = _listFace;}
  
  
  /*public void makeAdjacentFace()
  {
    for (Face face : listFace)
    {
      
      for (Face face2 : listFace)
      {
        int compteur = 0;
        if (face != face2)
        {
          for(Sommet sommet : face.getListSommet())
          {
            if(face2.getListSommet().contains(sommet)) compteur++;
            if (compteur == 2 ) break;
          }
          if (compteur == 2 ) 
          {
            if (!face.getListFaceAdjacent().contains(face2))
            {
              face.getListFaceAdjacent().add(face2);
              face2.getListFaceAdjacent().add(face);              
            }
          }
         }
      }
    }
  }*/
  
  public void doAdjacentFace()
  {
    for(int i = 0; i < listFace.size(); i++)
    {
      for(int j = i; j < listFace.size(); j++)
      {
        int compteur = 0;
        if(listFace.get(i) != listFace.get(j))
        {
          for(Sommet sommet : listFace.get(i).getListSommet())
          {
            if(listFace.get(j).getListSommet().contains(sommet)) compteur++;
            if (compteur == 2 ) break;
          }
          if (compteur == 2 ) 
          {
            if (!listFace.get(i).getListFaceAdjacent().contains(listFace.get(j)))
            {
              listFace.get(i).getListFaceAdjacent().add(listFace.get(j));
              listFace.get(j).getListFaceAdjacent().add(listFace.get(i));              
            }
          }          
        }
      }      
    }
  }
  
  public void drawMesh()
  {
  for (Face face : listFace)
  {
    //for( HalfEdge halfedge : face.getListHalfEdge()) halfedge.drawHalfEdge();
    shape(face.getShape());
    if(showName) for (Sommet sommet : face.getListSommet()) if (sommet.getName() != null) sommet.ShowName();
  }    
  }
}
