import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class home_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive Database"),
      ),
      body: Column(
        children: [Text("test")],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox("supriya");
          box.put("name", "Supriya Gupta");
          box.put("age", 12);
          print("Hive Database -- ${box.get('name')}");
          print("Hive Database -- ${box.get('age')}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
