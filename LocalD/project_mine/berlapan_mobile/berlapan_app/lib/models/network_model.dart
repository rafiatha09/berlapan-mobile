import 'package:berlapan_app/models/news_model.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
List<Post> parsePost(String response){
  var list = json.decode(response) as List<dynamic>;
  var post = list.map((model) => Post.fromJson(model)).toList();
  return post;
}

Future<List<Post>> fetchPost() async{
  final _baseurl = "https://jsonplaceholder.typicode.com/posts";
  final response = await http.get(Uri.parse(_baseurl));
  if(response.statusCode == 200){
    return compute(parsePost, response.body);
  }
  else{
    throw Exception("Request API error");
  }
}