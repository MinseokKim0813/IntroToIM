/*
Minseok Kim
 2021/06/07
 Artwork using image manipulation
 */

PImage img;
int r=int(random(255));
int g=int(random(255));
int b=int(random(255));
int change = 1;

void setup()
{
  background(200);
  size(800, 700);
  img = loadImage("skull.jpg");
}

void update()
{
  r+=change;
  g+=change;
  b+=change;

  if (r>=255 || g>=255 || b>=255)
  {
    change=-change;
  } else if (r<=0 || g<=0 || b<=0)
  {
    change=-change;
  }
}

void changePixel()
{
  loadPixels();

  color color1 = color(r, g, b);

  for (int j=0; j<1000; j++)
  {
    for (int i=int(random(width)); i<width*height; i+= width*2)
    {
      pixels[i]=color1;
      update();
    }

    int rand = int(random(height));

    for (int i=rand*width; i<rand*width+width; i++)
    {
      pixels[i]=color1;
      update();
    }
  }
  updatePixels();
}


void draw()
{
  image(img, 0, 0, width, height);
  changePixel();
}
