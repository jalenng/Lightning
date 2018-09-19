int startX;
int startY;
int endX;
int endY;
double lightningWidth;

void setup()
{
  size(300,300);
  background(0);
  initVars();
}
void initVars()
{
	startX = 0;
	startY = 150;
	endX = 0;
	endY = 150;
	lightningWidth = (Math.random() * 5) + 5;
}
void draw()
{
	stroke(randomInt(0, 255), randomInt(0, 255), randomInt(0, 255));
	while(lightningWidth > 0)
	{
		strokeWeight((int)lightningWidth);
		endX = startX + (int)(Math.random() * 10);
		endY = startY + (int)(Math.random() * 20) - 9;
		line(startX, startY, endX, endY);
		startX = endX;
		startY = endY;
		lightningWidth -= 0.1;
	}
}
void mousePressed()
{
	initVars();
}
int randomInt(int min, int max)
{
	int difference = max - min + 1;
	return (int)(Math.random() * difference) + min;
}