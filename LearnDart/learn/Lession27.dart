void main() {
  Rectangle2D r2d = Rectangle2D(0, 0, 10, 10);
  Rectangle3D r3d = Rectangle3D(0, 0, 10, 10, 0, 10);

  print(r2d.area());
  print(r3d.area());

  print(r2d.perimeter());
  print(r3d.perimeter());

  print(r3d.volume());
}

class Rectangle2D {
  int? x;
  int? y;
  int? width;
  int? height;

  Rectangle2D(int x, int y, int width, int height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }

  int perimeter() {
    return 2 * (width! + height!);
  }

  int area() {
    return width! * height!;
  }
}

class Rectangle3D extends Rectangle2D {
  int? z;
  int? depth;

  Rectangle3D(super.x, super.y, super.width, super.height, this.z, this.depth);

  int perimeter() {
    return 2 * (width! + height! + depth!);
  }

  int area() {
    return 2 * (width! * height! + width! * depth! + height! * depth!);
  }

  int volume() {
    return width! * height! * depth!;
  }
}
