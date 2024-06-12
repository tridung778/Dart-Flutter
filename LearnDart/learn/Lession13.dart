import 'dart:io';
import 'dart:math';

void main() {
  print('Nhap so nguyen n');
  var n = int.parse(stdin.readLineSync()!);
  if(isPrime(n)){
    print('$n la so nguyen to');
  }else{
    print('$n khong phai la so nguyen to');
  }
}

bool isPrime(int n) {
  if (n < 2) {
    return false;
  } else {
    int bound = sqrt(n).toInt();
    for (var i = 2; i <= bound; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }
}
