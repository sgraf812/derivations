public class Example {
  public void foo() {
    int n;
    n = 0; // Start
    if (n == 1) {
      n = 1; // A
      if (n == 2) {
        n = 2; // B
      } else {
        while (n == 3) { // C_1
          n = 3; // C_2
          if (n == 7) {
            n = 4; // D
          } else {
            n = 5; // E
          }
          n = 6; // F
          if (n == 1) { // G
            continue;
          } else {
            break;
          }
        }
        n = 8; // H
      }
    }
    n = 9; // End
  }
}
