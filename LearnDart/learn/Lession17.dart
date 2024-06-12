// Hàm vô danh
void main() {
  var friends = ['John', 'Peter', 'Sally'];
  friends.map((e){
    return e.toUpperCase();
  }).forEach((e){
    print(e);
  });
}
