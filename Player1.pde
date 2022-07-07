void paleta1() {
  fill(255);
  rect(posXp1, posYp1, 10, sizeP1);
  if (keyPressed) {
    if (key == 's') {
      posYp1 = posYp1 + 3;
    }
    if (key == 'w') {
      posYp1 = posYp1 - 3;
    }
  }
}
