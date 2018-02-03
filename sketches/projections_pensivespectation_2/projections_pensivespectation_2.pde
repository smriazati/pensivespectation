// declare & initialize variables for imageLoader
int counter = 16; // number of images, would be cooler if it could count the folder
PImage[] imgs = new PImage[counter]; // declary the array, create 20 spots

int currentIndex = 1;


void setup() {
  size(1600,1000); 
  background(0);
  
  frameRate(18);

  loadImage();

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
  
  scaleImage();
}

void scaleImage() {
  
  int imageWidth = imgs[currentIndex].width;
  int scaler = int(random(2,3));
  
  imgs[currentIndex].resize(imageWidth*scaler,imgs[currentIndex].height);
  
  println(imgs[currentIndex].width, imgs[currentIndex].height);
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