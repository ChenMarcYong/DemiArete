

Sommet A = new Sommet("A", 540f, 200f, 200f);
Sommet B = new Sommet("B", 720f, 540f, 0f);
Sommet C = new Sommet("C", 360f, 540f, 0f);
Sommet D = new Sommet("D", 540f, 400f, 100f);
Sommet E = new Sommet("E", 100f, 100f, 100f);

Face f1 = new Face("f1", A, C, D);
Face f2 = new Face("f2", A, B, D);
Face f3 = new Face("f3", B, C, D);
Face f4 = new Face("f4", A, B, C);

ArrayList<Face> listFace = new ArrayList<Face>();

Mesh object;
