import 'package:flutter/material.dart';
import 'api.dart';

void main() => runApp(MyApp());

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
    return new FutureBuilder(
      future: get_games(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData ? ListView(
          children: create_listing(snapshot.data),
        ):
        Center(
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
          ),
        );
      }
    );
  }
}
