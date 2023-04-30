import 'package:shared_preferences/shared_preferences.dart';

List<String>? listDog = [];
List<String> listOrder = [];

setSaveSharePreferences(listOrders) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('listOrders', listOrders);
}

getListDogSharePreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('listDog',
      <String>['Galgo Afegão', 'American Bully', 'Akita Inu', 'Bernese']);
  listDog = prefs.getStringList('listDog');
}

getListOrdersSharePreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList('listOrders') != null) {
    listOrder = prefs.getStringList('listOrders')!;
  } else {
    listOrder = [];
  }
}

