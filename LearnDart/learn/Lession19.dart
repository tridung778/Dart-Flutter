// Kiểu record

void main() {
  var record = ('First', age: 34, 45.5, true);
  // print(record.age);

  var result = stringToNumber();
  print(result.$2);
}

(String, int) stringToNumber() {
  return ('One', 1);
}
