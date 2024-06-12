void main() {
  Vector v1 = Vector(1, 2);
  Vector v2 = Vector(3, 4);

  Vector sum = v1 + v2;
  print(sum);

  Vector sub = v1 - v2;
  print(sub);
}

class Vector {
  int x = 0;
  int y = 0;

  Vector(this.x, this.y);

  Vector operator +(Vector order) => Vector(x + order.x, y + order.y);
  Vector operator -(Vector order) => Vector(x - order.x, y - order.y);

  @override
  String toString() {
    return 'Vector{x: $x, y: $y}';
  }
}
