import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const SERVER = "freegametracker-backend.herokuapp.com";

List<Widget> create_listing(Map<String, dynamic> json) {
  List<Widget> games = new List();
  List<dynamic> tmp;
  String expiration;

  for(int i=0; i<json.keys.length; i++) {
    tmp = json[json.keys.elementAt(i)];
    
    for(int j=0; j<tmp.length; j++) {
    
      if(tmp[j]["expiration"] != null) {
        expiration = tmp[j]["expiration"].replaceAll(new RegExp(r'T'), ' at ');
        expiration = expiration.substring(0, expiration.length-3);
        expiration = "Expiration: $expiration";
      } else{
        expiration = "No expiration date";
      }

      games.add(
        Card(
          child: ListTile(
              leading: Image.network(
                tmp[j]["mediaURL"],
                height: 100,
                width: 100,
              ),
              title: Text(tmp[j]["name"]),
              subtitle: Text(expiration),
              isThreeLine: true,
              trailing: OutlineButton(
                  onPressed: (){
                    launch(tmp[j]["link"]);
                  },
                  child: Text("Link"),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
              )
          ),
        ),
      );
    }
  }

  return games;
}


Future<Map<String, dynamic>> get_games() async{
  var data = await http.get(Uri.http(SERVER, "/"));
  var json = jsonDecode(data.body);
  return json;
}

