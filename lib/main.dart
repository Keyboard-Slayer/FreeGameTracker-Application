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
        brightness: Brightness.dark,
      ),

      home: Scaffold (
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Free Game Tracker",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300)),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: get_games(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            case ConnectionState.done:
              return ListView(
                children: create_listing(snapshot.data)
              );
          }
          return null;
        });
  }
}

