// extension method

void main() {
  var friends = ['Ahmed', 'Hossam', 'Ali', 'Fayez'];

  var reverse = -friends;
  showElements(friends);

  print("=========================");
  showElements(reverse);


  var message = "Hello World! I Am Learning Dart                     ";
  print(message.countString());
  print(message.countWord());
}

void showElements<T>(List<T> list) {
  for (var element in list) {
    print(element);
  }
}

extension myString on String {

  // Đếm số chữ trong chuỗi
  int countString() {
    int counter = 0;
    var words = this.split(' ');
    for (String word in words) {
      if (word.isNotEmpty) {
        counter++;
      }
    }
    return counter;
  }

  // Đếm số dấu cách trong chuỗi
  int countWord() {
    int counter = 0;
    for(int i = 0; i < this.length; i++) {
      if(this[i] == ' ') {
        counter++;
      }
    }
    return counter;
  }
}

extension ListExtension<T> on List<T> {
  List<T> operator -() => reversed.toList();
}
