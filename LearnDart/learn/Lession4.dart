import 'dart:io';

void main() {
  int x = 120;
  int k = int.parse(stdin.readLineSync()!);
  if (x % k == 0) {
    print("$x chia het cho $k");
  }
  else{
    print("$x khong chia het cho $k");
  }
}
