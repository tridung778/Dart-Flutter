// Contractor

void main() {
  var v1 = Vector2d(x: 100, y: 200);
  var v2 = Vector2d.origin();
  var v3 = Vector2d.fromJson({'x': 150, 'y': 234});

  print('v1(x,y): ${v1.x}, ${v1.y}');
  print('v2(x,y): ${v2.x}, ${v2.y}');
  print('v3(x,y): ${v3.x}, ${v3.y}');
}

class Vector2d {
  int x;
  int y;

  Vector2d({required this.x, required this.y});

  Vector2d.origin()
      : x = 0,
        y = 0;

  Vector2d.fromJson(Map<String, int> map)
      : x = map['x']!,
        y = map['y']!;
}
