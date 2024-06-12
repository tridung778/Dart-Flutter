// Future

import 'dart:io';

const fileName = 'test.txt';

void main() async {
  var data1 = _readFileSync();
  print(data1);

  var data2 = await _readFileAsync();
  print(data2);
}

String _readFileSync() {
  var file = File(fileName);
  var content = file.readAsStringSync();
  return content.toString();
}

Future<String> _readFileAsync() async {
  var file = File(fileName);
  var content = await file.readAsString();
  sleep(Duration(seconds: 5));
  return content.toString();
}
