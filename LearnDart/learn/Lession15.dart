void main() {
  goOut('Nam', "Nga");
  goOut('Nam', "Nga", 'Xe may');
}

void goOut(String who, String where, [String? by]) {
  var result = '$who go to $where';

  if (by != null) {
    result = '$who go to $where by $by';
  }
  print(result);
}
