int startX = 0;
int startY = 150;
int endX = 0;
int endY = 150;

void setup()
{
  size(300,300);
  strokeWeight(5);
  background(0);
}
void draw()
{
	stroke(randomInt(0, 255), randomInt(0, 255), randomInt(0, 255));
	while()
	{

	}
}
void mousePressed()
{

}
int randomInt(int min, int max)
{
	int difference = max - min + 1;
	return (int)(Math.random() * difference) + min;
}