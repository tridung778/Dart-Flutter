void main() {
  var numbers = [1, 2, 3, 4, 5, 6];
  var friends = ['Long', 'Hung', 'Hoang'];
  numbers.add(100);
  numbers.insert(2, 200);
  friends.add("Linh");

  // forEach loop
  print("Danh sach cac phan tu");
  for (var friend in friends) {
    friend = friend.toUpperCase();
    print(friend);
  }
  print("------------------------------------");
  for (var friend in friends) {
    if (friend.compareTo("Long") == 0) {
      print(friend);
    }
  }
}
