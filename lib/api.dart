import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const SERVER = "freegametracker-backend.herokuapp.com";

List<Widget> create_listing(List<dynamic> json) {
  List<Widget> games = new List();
  Map<String, dynamic> tmp;
  String expiration;

  for(int i = 0; i < json.length; i++) {
    tmp = json[i];
    print(tmp);
  }

  return games;
}


Future<List<dynamic>> get_games() async{
  var data = await http.get(Uri.http(SERVER, "/"));
  var json = jsonDecode(data.body);
  return json;
}