float [] x = new float [4];
float [] y = new float [4];
int timer = 0;
int count;

void setup() 
{
  size(200, 200);
  rectMode(CORNERS);
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
  for (int i = 0; i < x.length; i++)
  {
    x[i] = Float.valueOf(csv[i][1]).floatValue();
    y[i] = Float.valueOf(csv[i][2]).floatValue();
  } 
  count = Integer.valueOf(csv[0][0]).intValue();
  //test
  println(x[3]);
}

void draw() { 
  switch (frameCount % count) 
  {
  case 0:
    background(0);
    timer += 1;
    //quad(x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3]);
    switch(timer % 2)
    {
    case 0:
      rect(x[0], y[0], x[1], y[1]);
      break;
    case 1:
      rect(x[2], y[2], x[3], y[3]);
      break;
    }
  default:
    break;
  }
}

