// declare & initialize variables for imageLoader
int counter = 56; // number of images, would be cooler if it could count the folder
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
  image(imgs[currentIndex], mouseX, mouseY); //grab that band's image via the array index (i) 
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