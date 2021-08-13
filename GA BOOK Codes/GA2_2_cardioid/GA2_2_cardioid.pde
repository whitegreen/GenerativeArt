float r=400;
int n=72*6;
void setup(){
  size(800,800);
}
void draw(){
  background(255);
  translate(400,400);
  float s=1+0.05*frameCount; 
  for(int i=0;i<n;i++){
    float theta= 2*PI*i/n;
    float y= r*sin(theta);
    float x= r*cos(theta);
    float y2= r*sin(s*theta);
    float x2= r*cos(s*theta);
    line(x,y, x2,y2);
  }
}
