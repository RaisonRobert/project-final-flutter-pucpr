import 'package:flutter/material.dart';
import 'ListPet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Pet Shopping da Amazônia'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('click go List view'),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListPet();
            }));
          },
        ),
      ),
    );
  }
}
