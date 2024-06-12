import 'dart:io';

void main() {
  // switch statement
  print("Nhap so a: ");
  var a = int.parse(stdin.readLineSync()!);
  print("Nhap so b: ");
  var b = int.parse(stdin.readLineSync()!);

  print("Nhap phep tinh: ");
  var operator = stdin.readLineSync()!;

  var result;
  switch (operator) {
    case '+':
      result = a + b;
    case '-':
      result = a - b;
    case '*':
      result = a * b;
    case '/':
      if (b > 0) {
        result = a / b;
      } else {
        result = "b phai lon hon 0";
      }
    default:
      throw FormatException("Invalid Operator");
  }
  print('Ket qua cua $a $operator $b = $result');
}
