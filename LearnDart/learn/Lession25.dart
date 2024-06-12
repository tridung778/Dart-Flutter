// methods:

import 'dart:math';

void main() {
  var Point1 = Point(10, 20);
  var Point2 = Point(30, 40);
  var distance = Point1.distanceTo(Point2);
  Point1.showInfo();
  Point2.showInfo();
  print('distance: ${distance.toStringAsFixed(2)}');

  print("=====================================");

  var rec = Rectangle(100, 200, 10, 20);
  print('width: ${rec.width}, height: ${rec.height}');
  print('top: ${rec.top}, left: ${rec.left}');
  print('right: ${rec.right}, bottom: ${rec.bottom}');

  print("=====================================");

  var cal = MyCalculator();
  print('add: ${cal.add(10, 20)}');
  print('sub: ${cal.sub(10, 20)}');
  print('mul: ${cal.mul(10.0, 20.0)}');
  print('div: ${cal.div(10.0, 20.0)}');
}

class Point {
  int x = 0;
  int y = 0;

  Point(this.x, this.y);

  Point.origin()
      : this.x = 0,
        this.y = 0;

  double distanceTo(Point other) {
    var dx = other.x - this.x;
    var dy = other.y - this.y;
    return sqrt(dx * dx + dy * dy);
  }

  void showInfo() {
    print('x: $x, y: $y');
  }
}

class Rectangle {
  var width = 0;
  var height = 0;
  var top = 0;
  var left = 0;

  Rectangle(this.width, this.height, this.top, this.left);

  get right => left + width;

  set right(var value) => left = value - width;

  get bottom => top + height;

  set bottom(var value) => top = value - height;
}

abstract class Calculator {
  int add(int x, int y);

  int sub(int x, int y);

  double mul(double x, double y);

  double div(double x, double y);
}

class MyCalculator extends Calculator {
  @override
  int add(int x, int y) {
    return x + y;
  }

  @override
  double div(double x, double y) {
    return x / y;
  }

  @override
  double mul(double x, double y) {
    return x * y;
  }

  @override
  int sub(int x, int y) {
    return x - y;
  }
}
