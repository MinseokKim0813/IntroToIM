/*
Minseok Kim
 2021/06/02
 Art using class and tranformation
 */

int NUM_SHAPES = 40;
float speed = 1;

class Shapes
{
  int x, y, radius, w, h;
  int shape = int(random(3));
  int tri_len = (int(random(1, 3))*20);


  Shapes(int x_, int y_, int radius_, int w_, int h_)
  {
    x=x_;
    y=y_;
    radius=radius_;
    w=w_;
    h=h_;
  }





  void sketch()
  {

    if (shape==0)
    {
      rect(x, y, w, h);
    } else if (shape==1)
    {
      ellipse(x, y, radius, w);
    } else
    {
      triangle(x, y, x+tri_len, y, x, y+tri_len);
    }
  }
}

//void changeColor()
//{
//  int colors[] = new int[3];
//  for (int i=0; i<3; i++)
//  {
//    colors[i]=int(random(255));
//  }

//  if (frameCount % 10 == 6)
//  {
//    fill(colors[0], colors[1], colors[2]);
//  }
//}

Shapes shapeArray[] = new Shapes[NUM_SHAPES];

void setup()
{
  size(700, 700);
  background(200);
  stroke(0);

  for (int i=0; i<shapeArray.length; i++)
  {
    shapeArray[i] = new Shapes(int(random(20, width)), 0, int(random(width/30, width/10)), int(random(width/30, width/10)), int(random(width/30, width/10)));
  }
}


void draw()
{
  background(200);
  for (int i=0; i<shapeArray.length; i++)
  {
    pushMatrix();
    for (int j=0; j<100; j++)
    {
      rotate(PI/100);
      //shapeArray[i].changeColor();
      fill(random(255), random(255), random(255));
      shapeArray[i].sketch();
    }
    popMatrix();
  }
}
