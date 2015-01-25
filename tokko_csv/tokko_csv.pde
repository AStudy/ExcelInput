float [] x = new float [4];
float [] y = new float [4];
int timer = 0;
int count;
float dx;
float dy;
float dw;
float dh;
float timeOfVel = 10; // kaku kaku guai
boolean velDirection = true;

void setup() 
{
  size(200, 200);
  //rectMode(CORNERS);
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
  dx = (x[2] - x[0]) / timeOfVel;
  dy = (y[2] - y[0]) / timeOfVel;
  dw = (x[3] - x[1]) / timeOfVel;
  dh = (y[3] - y[1]) / timeOfVel;
  
  count = Integer.valueOf(csv[0][0]).intValue();
  //test
  println(x[3]);
}

void draw() { 
  switch (frameCount % count) 
  {
  case 0:
    background(255);
    timer += 1;
    //    //quad(x[0], y[0], x[1], y[1], x[2], y[2], x[3], y[3]);
    //    switch(timer % 2)
    //    {
    //    case 0:
    //      rect(x[0], y[0], x[1], y[1]);
    //      break;
    //    case 1:
    //      rect(x[2], y[2], x[3], y[3]);
    //      break;
    //    }
    if (timer < timeOfVel)
    {
      if (velDirection)
      {
        rect(x[0] + dx * timer, y[0] + dy * timer, x[1] + dw * timer, y[1] + dh * timer);
      } else
      {
        rect(x[2] - dx * timer, y[2] - dy * timer, x[3] - dw * timer, y[3] - dh * timer);
      }
    } else
    {
      if (velDirection)
      {
        rect(x[0] + dx * timer, y[0] + dy * timer, x[1] + dw * timer, y[1] + dh * timer);
      } else
      {
        rect(x[2] - dx * timer, y[2] - dy * timer, x[3] - dw * timer, y[3]-  dh * timer);
      }
      velDirection =! velDirection;
      timer = 0;
    }
    break;

  default:
    break;
  }
}

