import 'package:flutter/material.dart';
import 'api.dart';

void main() async {
  await get_games();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Free Game Tracker",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      home: Scaffold(
        body: Body(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Free Game Tracker",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          ),
        )
      )
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
      /*FutureBuilder(
        future: get_games(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            Text("OK");
          }
        }
        );
       */
  }
}
