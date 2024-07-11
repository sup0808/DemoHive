import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
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
                      trailing: IconButton(
                        onPressed: () {
                          snapshot.data!.put('name', 'Shrreja Gupta');
                          setState(() {});
                        },
                        icon: Icon(Icons.edit),
                      )),
                  Text(snapshot.data!.get('user').toString()),
                ],
              );
            },
          ),
          FutureBuilder(
            future: Hive.openBox("arvind"),
            builder: (context, snapshot) {
              return Column(
                children: [
                  ListTile(
                    title: Text(snapshot.data!.get('youtube').toString()),
                  ),
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

          // Another Box
          var box2 = await Hive.openBox('arvind');
          box2.put('youtube', 'google.com');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
