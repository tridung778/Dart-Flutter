void main() {
  var numbers = [1, 2, 3, 4, 5, 6];
  var friends = ['Long', 'Hung', 'Hoang'];
  numbers.add(100);
  numbers.insert(2, 200);
  friends.add("Linh");

  // for loop
  print("Danh sach cac phan tu");
  for (var index = 0; index < numbers.length; index++) {
    print('$index : ${numbers[index]}');
  }
}
