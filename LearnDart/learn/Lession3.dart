import 'dart:io';
import 'dart:convert';

void main() {
  print("Họ và tên: ");
  var fullName = stdin.readLineSync(encoding: utf8)!;

  print("Tuổi: ");
  int age = int.parse(stdin.readLineSync()!);

  print("Điểm GPA của bạn là bao nhiêu: ");
  double gpa = double.parse(stdin.readLineSync()!);

  print("Tên bạn là: $fullName");
  print("Tuổi bạn là: $age");
  print("GPA bạn là: ${gpa.toStringAsFixed(2)}");
}
