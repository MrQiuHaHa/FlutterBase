import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: null, child: Text('Home')),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/about');
              }, 
              child: Text('About')
            ),
          ],
        ),
      ),
    );
  }
}


class Pages extends StatelessWidget {

  final String title;

  Pages({
    this.title
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0, 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pop(context);
        }, 
        child: Icon(Icons.arrow_back)
      )
    );
  }
}