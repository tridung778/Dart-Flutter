void main() {
  print(dayOfWeek(5).$1);
  print(dayOfWeek(5).$2);
  print(dayOfWeek(5));
  print(dayOfWeek(8));
}

(String, String) dayOfWeek(int day) {
  return switch (day) {
    1 => ("Monday", "T2"),
    2 => ("Tuesday", "T3"),
    3 => ("Wednesday", "T4"),
    4 => ("Thursday", "T5"),
    5 => ("Friday", "T6"),
    6 => ("Saturday", "T7"),
    7 => ("Sunday", "CN"),
    _ => ("Invalid", "Khong hop le"),
  };
}
