import 'dart:io';

void main() {
  //break, continue
  int bound = 100;
  int k = int.parse(stdin.readLineSync()!);

  int count = 0;

  for (var i = 1; i <= bound; i++) {
    if (i % k == 0) {
      print(i);
      count++;
      if (count >= 2) {
        break;
      }
    }
  }
}
