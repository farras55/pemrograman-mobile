(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  var hasil = tukar((1, 2));
  print(hasil);

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa;
  mahasiswa = ('Muhammad Farras Awaludin Alwi', 244107060032);
  print(mahasiswa);

  var mahasiswa2 = ('Muhammad Farras Awaludin Alwi', a: 244107060032, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}
