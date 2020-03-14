import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {

  @override
  void initState() {
    // _fetchPost();

    final post = {
      'title': 'hello',
      'description': 'nice to meet you'
    };
    debugPrint(post['title']);
    debugPrint(post['description']);

    final jsonPost = jsonEncode(post);//map结构转jsonstring，这样才能传给后端
    debugPrint(jsonPost);

    final mapPost = jsonDecode(jsonPost);//jsonString转map
    debugPrint('取字典标题${mapPost['title']}');
    debugPrint(mapPost['description']);

    final postModel = Post.fromJson(mapPost);//map转模型
    debugPrint('title: ${postModel.title}, description: ${postModel.description}');

    debugPrint('${jsonEncode(postModel)}');//这个方法会自动触发Post里写的tojson方法转map,再完成模型转jsonstring

    super.initState();
  }

  _fetchPost() async {
    final response = await http.get('https://resources.ninghao.net/demo/posts.json');
    debugPrint('statusCode: ${response.statusCode}');
    debugPrint('body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

class Post {

  final String title;
  final String description;

  Post(
    this.title,
    this.description
  );

  Post.fromJson(Map json)
   : title = json['title'],
     description = json['description'];

  Map toJson() {
    return {'title':title,'description':description};
  }
}