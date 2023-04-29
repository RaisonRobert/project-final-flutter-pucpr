import 'package:flutter/material.dart';
import 'package:projeto_final_de_flutter/ListPedidos.dart';
import 'ListPet.dart';
String txtOrders = 'Acompanhar meu pedido';
String txtDog = 'Adotar um dog';
String title = 'Pet Shop da Amazônia';
double paddingValue = 32;
Color colorPrimary = const Color.fromRGBO(66, 72, 116, 1.0);
TextStyle styleFont = const TextStyle(
    fontWeight: FontWeight.w600, fontSize: 19, color: Colors.white);
List <String> listOrders = [];
List<String> listDogs = [
  "Galgo Afegão",
  "American Bully",
  "Akita Inu",
  "Bernese"
];

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Widget CardDog =
    _buildCardCenter(context,txtDog, onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListPet(listDogs);
      }));
    } );
    Widget CardTrackOrders =
    _buildCardCenter(context,txtOrders, onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListPedidos(listOrders);
      }));
    } );

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

  Center _buildCardCenter(BuildContext context, String title, {required Null Function() onTap}) {
    return  Center(
      child: InkWell(
        child: Card(
          color: colorPrimary,
          child: SizedBox(
            width: 600,
            height: 240,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    title,
                    style: styleFont
                ),
              ],
            ),
          ),
        ),
        onTap: () => onTap()
      ),
    );
  }

}
