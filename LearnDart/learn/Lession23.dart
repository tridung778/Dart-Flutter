// class vs object

class Dog {
  String? color;
  String? favoriteFood;

  void eat() {
    print('A dog eating $favoriteFood');
  }
}

class Student {
  String? name;
  int? age;
  String? major;

  void study(String major) {
    print('I am studying $major');
  }
}

void main() {
  var dog = Dog();
  dog.favoriteFood = 'bone';
  dog.eat();

  var dung = Student();
  dung.study('Dart');
}
