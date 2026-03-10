void main() {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  var list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...list1];
  print(list3.length);

  var charNIM = [2, 4, 4, 1, 0, 7, 0, 6, 0, 0, 3, 2];
  var nim = [...charNIM];
  print(nim);

  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print(nav); // promoActive = true

  promoActive = false;
  var nav2 = ['Home', 'Furniture', 'Plants'];
  print(nav2); // promoActive = false

  var login = 'Manager';
  var nav3 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav3);

  login = 'Staff';
  var nav4 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print(nav4);

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}