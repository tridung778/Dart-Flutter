// Interface

void main() {
  var Rect = Rectangle(width: 10, height: 20);
  print(Rect.area());
  print(Rect.perimeter());
}

abstract interface class IShape {
  int x = 0;
  int y = 0;

  double area();

  double perimeter();
}

class Rectangle implements IShape {
  double width = 0.0;

  double height = 0.0;

  Rectangle({required this.width, required this.height});

  @override
  int x = 0;

  @override
  int y = 0;

  @override
  double area() {
    return width * height;
  }

  @override
  double perimeter() {
    return 2 * (width + height);
  }
}
