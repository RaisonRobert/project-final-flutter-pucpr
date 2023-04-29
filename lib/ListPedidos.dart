import 'package:flutter/material.dart';
import 'HomePage.dart';

class ListPedidos extends StatelessWidget {
  ListPedidos(List<String> listOrders);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Acompanhar meu pedido'),
        ),
        body: ListView(
          children:<Widget>[
            for (var item in listOrders) _buildCardCenter(context, item, onTap: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // retorna um objeto do tipo Dialog
                  return AlertDialog(
                    title:  Text("Atenção"),
                    content:  Text("Entraremos em contato, aguarde a entrega"),
                    actions: <Widget>[
                      // define os botões na base do dialogo
                      TextButton(
                        child: const Text('ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }),
          ],
        )
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
