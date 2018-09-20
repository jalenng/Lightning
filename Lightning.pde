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
	startX = 150;
	startY = 0;
	endX = 150;
	endY = 0;
	lightningWidth = (Math.random() * 7);
}
void draw()
{
	fill(0, 0, 0, 10);
	rect(0, 0, width, height);
	if ((Math.random() * 100) < 1) {
		drawLightning();
	}
}
void mousePressed()
{
	drawLightning();
}
void drawLightning()
{
	initVars();
	stroke(randomInt(0, 255), randomInt(0, 255), 0);
	while (lightningWidth > 0)
	{
		strokeWeight((int)lightningWidth);
		endX = startX + (int)(Math.random() * 20) - 9;
		endY = startY + (int)(Math.random() * 10);
		line(startX, startY, endX, endY);
		startX = endX;
		startY = endY;
		lightningWidth -= 0.1;
	}
}
int randomInt(int min, int max)
{
	int difference = max - min + 1;
	return (int)(Math.random() * difference) + min;
}