float [] x = new float [4];
float [] y = new float [4];

void setup() 
{
  size(200, 200);
  String lines[] = loadStrings("test.csv");
  String [][] csv;
  int csvWidth=0;

  for (int i=0; i < lines.length; i++) 
  {
    String [] chars=split(lines[i], ',');
    if (chars.length>csvWidth) {
      csvWidth=chars.length;
    }
  }
  csv = new String [lines.length][csvWidth];
  for (int i=0; i < lines.length; i++)
  {
    String [] temp = new String [lines.length];
    temp= split(lines[i], ',');
    for (int j=0; j < temp.length; j++) {
      csv[i][j]=temp[j];
    }
  }
  for(int i = 0; i < x.length; i++)
  {
    x[i] = Float.valueOf(csv[i][0]).floatValue();
    y[i] = Float.valueOf(csv[i][1]).floatValue();
  }
  quad(x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3]);

  
  //test
  println(csv[0][0]);
}

void draw(){
  }
