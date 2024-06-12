// Ngoại lệ

void main() {
  try {
    var a = int.parse('1234');
    print(a / 0);
  } on FormatException {
    print("Loại dữ liệu");
  } on Exception {
    print("Khác lỗi");
  } catch (e, st) {
    print('$e + $st');
  }
}

abstract class Printer {
  void printSomething(double value);
}

class MyPrinter extends Printer {
  @override
  void printSomething(double value) {
    throw Exception("Phương thức chưa được triển khai");

    // throw Error();
  }
}
