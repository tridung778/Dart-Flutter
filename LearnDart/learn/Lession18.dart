// Hàm đệ quy

void main() {
  // var result = sum(10000);

  var result = fibonacci(10);


  print(result);
}

int sum(int n) {
  if (n == 1) {
    return n;
  } else {
    return n + sum(n - 1);
  }
}

int fibonacci(int n){
  if(n == 0 || n == 1){
    return n;
  }else{
    return fibonacci(n-1) + fibonacci(n-2);
  }
}
