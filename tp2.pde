//https://youtu.be/v3WfhMmibzQ
//Lautaro Gomez Arenillas

int cant = 50; 

void setup(){
  size(600,600);
}

void draw(){
  translate(width/2,height/2);
  for (int i=1; i<=cant; i++){
      if (i%2 == 0){
        fill(255);
        stroke(255);
      }else{
        fill(0); 
        stroke(0);
      }
    ellipse(15,15,width/i+cant*.25,height/i+cant*.25);
    rotate(map(mouseX,0,width,-radians(1.1),radians(1.1)));
  }
}
