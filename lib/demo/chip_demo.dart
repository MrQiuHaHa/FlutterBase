import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),

                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),

                Chip(
                  label: Text('JunRong'),
                  backgroundColor: Colors.yellow,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Text('邱'),
                  ),
                ),

                Chip(
                  label: Text('TaoZi'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
                  ),
                ),
                Chip(
                  label: Text('JunRong'),
                  backgroundColor: Colors.blue,
                  avatar: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: Text('邱'),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}