int startX;
int startY;
int endX;
int endY;
int lightningWidth;
int lightningBrightness;

void setup()
{
  size(1000,1000);
  background(0);
  initVars();
}
void initVars()
{
	startX = (int)(Math.random() * width);
	startY = 0;
	endX = startX;
	endY = 0;
	lightningWidth = (int)(Math.random() * 30);
	lightningBrightness = randomInt(155, 255);
}
void draw()
{
	fill(0, 0, 0, 50);
	rect(0, 0, width, height);
	if ((Math.random() * 50) < 1) {
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
		endX = startX + (int)(Math.random() * (width / 15) - (width / 30));
		endY = startY + (int)(Math.random() * (width / 15));
		drawSegments(startX, startY, endX, endY);
		startX = endX;
		startY = endY;
		lightningWidth -= 0.1;
	}
}
void drawSegments(int sX, int sY, int eX, int eY)
{
	int temporaryBrightness = lightningBrightness - 55;
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