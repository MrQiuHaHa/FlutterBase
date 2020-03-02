import 'package:flutter/material.dart';
import './demo/listview_demo.dart';

void main () => runApp(App()); 


class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.green
      )
    );
  }
}

class Home extends StatelessWidget
{
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title:Text('FLUTTER APP',style: TextStyle(color:Colors.white)),
          elevation: 0.0,
        ),
        body: ListViewDemo()
      );
  }
}



// class Hello extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Center(
//       child: Text(
//           'hello world !',
//           textDirection: TextDirection.ltr,
//           style: TextStyle(
//             fontSize:40,
//             fontWeight:FontWeight.bold,
//             color:Colors.red
//           )
//       )
//     );
//   }
// }