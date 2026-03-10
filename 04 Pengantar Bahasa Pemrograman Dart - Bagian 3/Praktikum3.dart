void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'nama': 'Muhammad Farras Awaludin Alwi',
    'nim': '244107060032',
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
    'nama': 'Muhammad Farras Awaludin Alwi',
    'nim': '244107060032',
  };

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var mhs1 = Map<String, String>();
  mhs1['nama'] = "Muhammad Farras Awaludin Alwi";
  mhs1['nim'] = "244107060032";

  var mhs2 = Map<int, String>();
  mhs2[1] = "Muhammad Farras Awaludin Alwi";
  mhs2[2] = "244107060032";

  print("ini variabel gifts");
  print(gifts);
  print("ini variabel nobleGases");
  print(nobleGases);
  print("ini variabel mhs1");
  print(mhs1);
  print("ini variabel mhs2");
  print(mhs2);
}