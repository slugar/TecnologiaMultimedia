void pelota(){
  fill(255);
ellipse(posXpel,posYpel,radio,radio);
posXpel = posXpel + dirXpel * vel;
posYpel = posYpel + dirYpel * vel;
if(posXpel + radio/2 >= width || posXpel + radio/2 <= 15 ){
dirXpel *= -1;
}
if( posYpel + radio/2 >= height || posYpel + radio/2 <= 15){
dirYpel *= -1;
}
}
void condicion(){
 if(posXpel <= 20 && posYpel <= sizeP1 + posYp1 && posYpel >= posYp1){
   dirXpel *= -1;
   dirYpel *= -1;
 }
 if(posXpel >= width - 20 && posYpel <= sizeP2 + posYp2 && posYpel >= posYp2){
   dirXpel *= -1;
   dirYpel *= -1;
 }
  
}
