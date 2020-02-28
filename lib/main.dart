import 'package:flutter/material.dart';
import 'model/post.dart';

void main () => runApp(App()); 


class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text('FLUTTER APP',style: TextStyle(color:Colors.black)),
          elevation: 0.0,
        ),
        body: Hello()
      ),
      theme: ThemeData(
          primarySwatch: Colors.green
      )
    );
  }
}

class Hello extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text(
          'hello world !',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize:40,
            fontWeight:FontWeight.bold,
            color:Colors.red
          )
      ),
    );
  }
}