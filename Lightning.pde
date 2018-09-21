int startX;
int startY;
int endX;
int endY;
int lightningWidth;
int lightningBrightness;

PImage img;

void setup()
{
  size(500,500);
  background(0);
  img = loadImage("superren.png");
  initVars();
}
void initVars()
{
	/*
	 * startX = (int)(Math.random() * width);
	 * startY = 0;
	 * endX = startX;
	 * endY = 0;
	 */
	 startX = width / 3 * 2;
	 startY = height / 3 * 2;
	 endX = startX;
	 endY = startY;
	lightningWidth = (int)(Math.random() * 15);
	lightningBrightness = randomInt(155, 255);
}
void draw()
{
	fill(0, 0, 0, 50);
	rect(0, 0, width, height);
	image(img, width / 3 * 2, height / 3 * 2, width / 3, height / 3);
	if ((Math.random() * 50) < 10) {
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
	for(int i = temporaryBrightness; i > 0; i -= lightningWidth)
	{
		strokeWeight(lightningWidth);
		int ratio = (i / temporaryBrightness);
		stroke(255, 255, 255, i);
		int distance = (temporaryBrightness - i);
		line(sX, sY, eX, eY);
		line(sX + distance, sY, eX + distance, eY);
		line(sX - distance, sY, eX - distance, eY);
	}
}
int randomInt(int min, int max)
{
	int difference = max - min + 1;
	return (int)(Math.random() * difference) + min;
}