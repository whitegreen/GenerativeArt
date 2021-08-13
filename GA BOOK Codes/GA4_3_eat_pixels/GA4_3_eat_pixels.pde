PImage img; 
void setup(){
  size(800,627);
  img = loadImage( "alp.jpg");
}
void draw(){
  color[] ps = img.pixels;
  int num=height-frameCount;
  for(int i= num+1; i< height; i++) // row
    for(int j=0; j< width; j++) //col
       ps[ i*width +j ] =ps[ num*width +j ]; 
  img.updatePixels();
  image(img, 0,0);
}
