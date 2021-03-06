int startX;
int startY;
int endX;
int endY;
int lightningWidth;
int lightningBrightness;

PImage img;

void setup()
{
  size(500, 500);
  frameRate(30);
  background(0);
  img = loadImage("superren.png");
  initVars();
}
void initVars()
{
	startX = width / 9 * 7;
	startY = height / 30 * 21;
	endX = startX;
	endY = startY;
	lightningWidth = (int)(Math.random() * 15);
	lightningBrightness = (int)(Math.random() * 100) + 155;
}
void draw()
{
	fill(0, 0, 0, 40);
	rect(0, 0, width, height);
	image(img, width / 3 * 2, height / 3 * 2, width / 3, height / 3);
	if ((Math.random() * 10) < 1)
	{
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
	while (lightningWidth > 0)
	{
		/*
		 * endX = startX + (int)(Math.random() * (width / 5) - (width / 10));
		 * endY = startY + (int)(Math.random() * (height / 5));
		 */
		endX = startX - (int)(Math.random() * (width / 5));
		endY = startY + (int)(Math.random() * (height / 5) - (height / 10));
		drawSegments(startX, startY, endX, endY);
		startX = endX;
		startY = endY;
		lightningWidth -= 0.1;
	}
}
void drawSegments(int sX, int sY, int eX, int eY)
{
	int temporaryBrightness = lightningBrightness - 80;
	for(int i = temporaryBrightness; i > 0; i -= lightningWidth + 1)
	{
		int ratio = (i / temporaryBrightness);
		stroke(255, 255, 255, i);
		int distance = (temporaryBrightness - i);
		strokeWeight(lightningWidth);
		line(sX, sY, eX, eY);
		strokeWeight(lightningWidth + 1);
		line(sX, sY + distance, eX, eY + distance);
		line(sX, sY - distance, eX, eY - distance);
	}
}
