import 'dart:io';

void main() {
  // switch expression
  print("Nhap so a: ");
  var a = int.parse(stdin.readLineSync()!);
  print("Nhap so b: ");
  var b = int.parse(stdin.readLineSync()!);

  print("Nhap phep tinh: ");
  var operator = stdin.readLineSync()!;

  var result = switch (operator) {
    '+' => a + b,
    '-' => a - b,
    '*' => a * b,
    '/' => a / b,
    _ => throw FormatException("Invalid Operator")
  };
  print('Ket qua cua $a $operator $b = $result');
}
