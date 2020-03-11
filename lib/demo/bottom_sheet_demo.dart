
import 'package:flutter/material.dart';
import 'dart:async';

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {

  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet1() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(width: 16),
              Text('01:30  /  03:30'),
              Expanded(child: Text('Fix you - ColdPlay',textAlign: TextAlign.right,),),
            ],
          ),
        ),
      );
    });
  }
  Future _openBottomSheet2() async {

  String option = await showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) {
        return Container(
            height: 200.0,
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context,'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context,'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context,'C');
                  },
                ),
              ],
            ),
          ); 
      }
    );

    if (option == null) {
      return;
    }

    debugPrint(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                  onPressed: _openBottomSheet1, 
                  child: Text('Open BottomSheet method 1'),
                ),
            SizedBox(height: 30,),
            FlatButton(
                  onPressed: _openBottomSheet2, 
                  child: Text('Open BottomSheet method 2')
            )
          ],
        ),
      ),
    );
  }
}