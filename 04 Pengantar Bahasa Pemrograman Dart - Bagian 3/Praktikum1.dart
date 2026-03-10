void main() {
  final List<String?> list = List.filled(5, null);
  assert(list.length == 5);
  assert(list[1] == null);
  print(list.length);
  print(list[1]);

  list[1] = 'Muhammad Farras Awaludin Alwi';
  list[2] = '244107060032';
  assert(list[1] == 'Muhammad Farras Awaludin Alwi');
  assert(list[2] == '244107060032');
  print(list[1]);
  print(list[2]);
}