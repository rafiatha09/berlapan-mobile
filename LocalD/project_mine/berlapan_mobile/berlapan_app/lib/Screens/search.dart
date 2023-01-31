import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:berlapan_app/models/news_model.dart';
import 'package:berlapan_app/models/network_model.dart';
import 'package:berlapan_app/screens/home.dart';
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

// https://v1.nocodeapi.com/rafiatha11/xml_to_json/XAEksBgurJJkpFsB?url=https://covid19.go.id/feed/masyarakat-umum
class _SearchState extends State<Search> {

  List<Post> post = [];
  List<Post> post_display = [];

  bool loading = true;

  @override
  void initState(){
    fetchPost().then((value){
      setState(() {
        loading = false;
        post.addAll(value);
        post_display = post;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,index){
        if(!loading){
          return index == 0 ? _searchBar():_listItem(index-1);
        }
        else{
          return  Center(
            child: Container(
              padding: const EdgeInsets.only(top: 40, bottom: 0),
              child: const CircularProgressIndicator(),
            ),
          );
        }
      },
      itemCount: post_display.length + 1 ,
    );
  }
  _searchBar(){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.green,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.green,
                style: BorderStyle.solid,
                width: 0.0,
              ),
            ),
            prefixIcon: const Icon(Icons.search) ,
            hintText: 'Search News'
        ),
        onChanged: (text){
          text = text.toLowerCase();
          setState(() {
              post_display = post.where((post){
              var postTitle = post.title.toLowerCase();
              return postTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index){
    return GestureDetector(
        onTap: (){
          setState(() {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  PopUp(title:  post_display[index].title, content: post_display[index].body,)),
            );
          });
        },
        child: Card(
          elevation: 2.0,
          margin: const EdgeInsets.only(bottom: 15.0, left: 10.0, right: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child :Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  post_display[index].title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  post_display[index].body,
                  style: const TextStyle(fontSize: 11
                  ),
                ),
              ],
            ),
          ) ,
        )
    );
  }
}
