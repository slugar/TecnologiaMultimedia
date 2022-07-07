void paleta2() {
  fill(255);
  rect(posXp2, posYp2, 10, sizeP2);
  if (keyPressed) {
    if (key == 'l') {
      posYp2 = posYp2 + 3;
    }
    if (key == 'o') {
      posYp2 = posYp2 - 3;
    }
  }
}
