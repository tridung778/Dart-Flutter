// abstract class

void main() {
  Circle c = Circle(x: 0, y: 0, radius: 5);
  print(c.area());
  print(c.perimeter());
  print('-----------------');
  Rectangle r = Rectangle(x: 0, y: 0, width: 5, height: 10);
  print(r.area());
  print(r.perimeter());
}

abstract class Shape2D {
  int x;
  int y;

  Shape2D({required this.x, required this.y});

  double area(); //abstract method

  double perimeter(); //abstract method
}

class Circle extends Shape2D {
  final PI = 3.14159265;

  double radius;

  Circle({required super.x, required super.y, required this.radius});

  @override
  double area() {
    return PI * radius * radius;
  }

  @override
  double perimeter() {
    return 2 * PI * radius;
  }
}

class Rectangle extends Shape2D {
  double width;
  double height;

  Rectangle(
      {required super.x,
      required super.y,
      required this.width,
      required this.height});

  @override
  double area() {
    return width * height;
  }

  @override
  double perimeter() {
    return 2 * (width + height);
  }
}
