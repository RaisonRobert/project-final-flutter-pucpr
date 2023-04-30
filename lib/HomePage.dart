import 'package:flutter/material.dart';

import 'ListPedidos.dart';
import 'ListPet.dart';
import 'SharePreferencesFunction.dart';

String txtOrders = 'Acompanhar meu pedido';
String txtDog = 'Adotar um dog';
String title = 'Pet Shop da Amazônia';
double paddingValue = 32;
Color colorPrimary = const Color.fromRGBO(66, 72, 116, 1.0);
TextStyle styleFont = const TextStyle(
    fontWeight: FontWeight.w600, fontSize: 19, color: Colors.white);

class HomePage extends StatelessWidget {
// Try reading data from the 'items' key. If it doesn't exist, returns null.

  @override
  Widget build(BuildContext context) {
    getListDogSharePreferences();
    getListOrdersSharePreferences();
    Widget CardDog = _buildCardCenter(context, txtDog, onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListPet(listDog);
      }));
    });
    Widget CardTrackOrders = _buildCardCenter(context, txtOrders, onTap: () {
      if (listOrder.isNotEmpty) {
        getListOrdersSharePreferences();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ListPedidos(listOrder);
        }));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Atenção"),
                content: Text("vc não possui pedidos"),
                actions: <Widget>[
                  TextButton(
                    child: const Text('ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      }
    });

    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: colorPrimary,
            title: Text(title),
          ),
          body: ListView(
            children: [CardDog, CardTrackOrders],
          )),
    );
  }

  Center _buildCardCenter(BuildContext context, String title,
      {required Null Function() onTap}) {
    return Center(
      child: InkWell(
          child: Card(
            color: colorPrimary,
            child: SizedBox(
              width: 600,
              height: 240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(title, style: styleFont),
                ],
              ),
            ),
          ),
          onTap: () => onTap()),
    );
  }
}
