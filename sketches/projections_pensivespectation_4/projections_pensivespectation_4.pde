// declare & initialize variables for loadImage
int counter = 51; // number of images, would be cooler if it could count the folder
PImage[] imgs = new PImage[counter]; // declary the array, create 20 spots

int currentIndex = int(random(1,counter));

// declare & initialize variables for scaleImage function
int scaler = 1;

PFont f;


void setup() {
  size(1600,1000); 
  background(0);
  
  frameRate(18);

  loadImage();

  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on

}

void draw() { 

  pensiveSpectation();
  
  saveImage();

}

void mouseClicked() {
 
  println(currentIndex);
  currentIndex = int(random(0,counter));
  
}




void pensiveSpectation() {
  imageMode(CENTER);
  image(imgs[currentIndex], mouseX, mouseY); 
  
  recolorImage();
}

void recolorImage() {

  imgs[currentIndex].loadPixels();
  int dimension = int(random(0,imgs[currentIndex].width)) * imgs[currentIndex].height;

  for (int i = 0; i < dimension; i += 3) { 
    int randomColor = int(random(50,255));
    imgs[currentIndex].pixels[i] = color(0,0,randomColor); 
  } 
  imgs[currentIndex].updatePixels();
  

}


void loadImage() {
  StringList inventory;
  inventory = new StringList();

  for (int i = 1; i < counter; i++) {
    imgs[i] = loadImage("photo" + i + ".jpg");
    String currentImage = "photo" + i + ".jpg";
    inventory.append(currentImage);
  }

  println(inventory);

}


void saveImage() {
  
  // hit S to save
  if (keyPressed) {
      if (key == 's' || key == 'S') {
        saveFrame("pensivespectation-#######.png");
      }
  } 
  
  // uncomment the line below to save most every frame, in case of quick changes
  // saveFrame("pensivespectation-#######.png");

}