void main() {
  String nama = "Muhammad Farras Awaludin Alwi";
  String nim = "244107060032";

  for (int i = 0; i <= 201; i++) {
    bool bilPrima = true;

    for (int j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        bilPrima = false;
        break;
      }
    }

    if (i < 2) {
      bilPrima = false;
    }

    if (bilPrima) {
      print("$i : $nama - $nim");
    } else {
      print("$i");
    }
  }
}