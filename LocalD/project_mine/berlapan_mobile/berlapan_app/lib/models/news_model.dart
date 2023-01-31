import 'dart:convert';
import 'package:http/http.dart' as http;

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class Blog {
  final String username;
  final String email;

  Blog({
    required this.username,
    required this.email,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      username: json['fields']['username'],
      email: json['fields']['email'],
    );
  }
}

class Repo {
  final _baseurl = "http://berlapan.herokuapp.com/json";
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Blog> blog = it.map((e) => Blog.fromJson(e)).toList();
        return blog; // list model blog
      }
    } catch (error) {
      throw Exception("Error");
    }
  }
}
