class Chunk
{
  private Strip[][] listStrip;
  private int x, y;
  
  public Chunk(int _x,int _y)
  {
    x = _x;
    y = _y;
    listStrip = new Strip[x][y];
  }
  
  public void initChunk()
  {
    float distance = 16;
    for ( int i = 0; i < x; i++)
    {
      for ( int j = 0; j < y; j++)
      {
        Strip strip = new Strip(16, 200, 0.075, i * distance, j * distance);
        strip.InitStrip();
        listStrip[i][j] = strip;
      }
    }
  }
  
  public void DrawChunk()
  {
    float distance = listStrip[0][0].getStripLenght();
    //pushMatrix();
    for ( int i = 0; i < x; i++)
    {
      for ( int j = 0; j < y; j++)
      {
        
        if(j != 0) translate(distance, 0, 0);
        
        listStrip[i][j].drawStrip();
      }
      translate(0, distance, 0);
    } 
    //popMatrix();
  }
  
}
