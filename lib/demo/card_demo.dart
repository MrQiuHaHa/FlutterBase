import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: ClipRRect(
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0)
                      ),
                    )
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imageUrl),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(post.description,maxLines: 2,overflow: TextOverflow.clip,),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarThemeData(),
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          onPressed: (){}, 
                          child: Text('like'.toUpperCase(),style: TextStyle(color: Colors.red),)
                        ),
                        FlatButton(
                          onPressed: (){}, 
                          child: Text('read'.toUpperCase())
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        )
      ),
    );
  }
}