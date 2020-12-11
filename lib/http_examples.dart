import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'article.dart';
import 'global.dart';

void main() async {
  // await get();
  await post();
  // print("Start func");
  // function();
}

void get() async {
  print("start...");
  var url = 'https://api.flutterbootcamp.com/article';

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);
  print(response.body);
}

void post() async {
  print("Start Post");

  var url = 'https://api.flutterbootcamp.com/article';
  //print(Article.dress1().toJson().toString());
  var json = convert.jsonEncode(Article.dress3());
  print(json);
  var response = await http.post(url, body: json);
  print(response.request.toString());
  print(response.body);

  print('Response status: ${response.statusCode}');
}

void function() async {
  var url = 'https://api.flutterbootcamp.com/article';

  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    var itemCount = jsonResponse['number_of_items'];
    print('Number of item in the list: $itemCount.');
    print(jsonResponse);
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
