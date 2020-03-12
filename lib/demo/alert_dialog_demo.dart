import 'package:flutter/material.dart';
import 'dart:async';

enum Action{
  Ok, Cancel
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {

  String _choice = 'Nothing';

  Future _openAlertDialog () async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('Are you sure about this ?'),
          actions: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pop(context,Action.Cancel);
              }, 
              child: Text('Cancel'),
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context,Action.Ok);
              }, 
              child: Text('Sure',style: TextStyle(color: Colors.red),),
            ),
          ],
        );
      },
    );

    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'OK';
        });
        break;
      case(Action.Cancel):
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your Choice is : $_choice'),
            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: _openAlertDialog,
                  child: Text('Open AlertDialog'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}