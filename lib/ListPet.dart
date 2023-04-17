import 'package:flutter/material.dart';
import 'HomePage.dart';

class ListPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Liste Pet'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('click go List view'),
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return HomePage();
            }));
          },
        ),
      ),
    );
  }
}
