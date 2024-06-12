// Mixin

void main() {
  var a = A();
  a.methodA();
  print(a.add(3, 5));
}

abstract mixin class MXCalculator {
  num add(num a, num b);
}

mixin Printer {
  void printWithPrecision(double n, int precision) {
    print(n.toStringAsFixed(precision));
  }
}

class A with Printer, MXCalculator {
  void methodA() {
    printWithPrecision(3.44444444444444444444, 3);
  }

  @override
  num add(num a, num b) {
    return a + b;
  }
}
