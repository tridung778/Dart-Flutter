// Ngoại lệ

void main() {
  var a = 100;
  var b = 0;

  try {
    print(a ~/ b);
  } on Exception {
    print("Khong the chia cho 0");
  }

  var x = MyPrinter();
  try {
    x.printSomething(10.0);
  } catch (e) {
    print(e);
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
