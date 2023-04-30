import 'package:flutter/material.dart';
import 'SharePreferencesFunction.dart';
import 'HomePage.dart';

class ListPet extends StatelessWidget {
  ListPet(List<String>? listDogs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Liste Pet'),
        ),
        body: ListView(
          children: <Widget>[
            for (var item in listDog!)
              _buildCardCenter(context, item, onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    // retorna um objeto do tipo Dialog
                    return AlertDialog(
                      title: Text("Confirme sua opção"),
                      content: Text("Você Selecionou: '${item}' "),
                      actions: <Widget>[
                        // define os botões na base do dialogo
                        TextButton(
                          child: const Text('não'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('sim'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Solicitado com sucesso"),
                                  content: Text("Dog: '${item}' "),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('ok'),
                                      onPressed: () {
                                        listOrder.add(item);
                                        setSaveSharePreferences(listOrder);
                                        Navigator.of(context).pop();
                                        Navigator.pop(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HomePage();
                                        }));
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              }),
          ],
        ));
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
