void setup(){
 size(400,400);
 background(100,0,255);
  
  
}

void draw (){
  noStroke();
  fill(206,167,131);//color piel
 rect(100,50,200,300,23); 
  fill(193,155,119);//color naris 
 rect(150,150,70,120,50,0,0,23); 
  fill(0);//boca
 rect(200,300,150,20);
 fill(255);//ojos
 rect(120,100,60,40,30,30,30,30);  
  rect(width-160,100,60,40,30,30,30,30);
 fill(0);//pupilas
 ellipse(140,120,30,30);
 ellipse(260,120,30,30);
 fill(95,65,35);//pelo 1
  rect(200,50,110,30,0,30,0,30);
 fill(135,90,44); //pelo 2
 rect(50,15,200,60,60,0,60,0);
 fill(200,10,10);
textSize(60);
text("Lautaro",60,370);  
}
