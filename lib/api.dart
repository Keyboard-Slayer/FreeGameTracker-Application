import 'dart:convert';

import 'package:http/http.dart' as http;
const SERVER = "freegametracker-backend.herokuapp.com";

class Game {
  String expiration;
  String link;
  String picture;
  String name;
  String publication;

  Game({
    this.expiration,
    this.link,
    this.picture,
    this.name,
    this.publication
  });
}

Future get_games() async{
  var data = await http.get(Uri.http(SERVER, "/"));
  var json = jsonDecode(data.body);

  print(json);

  return json;
}