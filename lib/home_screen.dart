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
        children: [
          FutureBuilder(
            future: Hive.openBox("supriya"),
            builder: (context, snapshot) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('name').toString()),
                    subtitle: Text(snapshot.data!.get('age').toString()),
                  ),
                  Text(snapshot.data!.get('user').toString()),
                ],
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var box = await Hive.openBox("supriya");
          box.put("name", "Supriya Gupta");
          box.put("age", 12);
          box.put('user', {'id': 1, 'name': "Arvind", 'company': "Cognizant"});

          print("Hive Database -- ${box.get('name')}");
          print("Hive Database -- ${box.get('age')}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
