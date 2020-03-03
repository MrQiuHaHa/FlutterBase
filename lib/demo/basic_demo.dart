import 'dart:ui';

import 'package:flutter/material.dart';


class BasicDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5), 
            BlendMode.hardLight
          )
        ),

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(Icons.pool,size: 32.0,color: Colors.white,),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              border: Border.all(
                color: Colors.indigoAccent[100],
                width: 3.0,
                style: BorderStyle.solid
              ),
              // borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 16),
                  color: Color.fromRGBO(16, 20, 188, 1.0),
                  blurRadius: 25,
                  spreadRadius: -9.0
                )
              ],
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color.fromRGBO(7, 102, 255, 1.0),Colors.red],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            ),
          )
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RichText(
      text: TextSpan(
        text: 'ninghao',
        style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 34,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w100
        ),
        children: [
          TextSpan(
            text: '.net',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey, 
            ),
          ),
        ]
      )
    );
  }
}

class TextDemo extends StatelessWidget
{

  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  final String _author = '辛弃疾';
  final String _title = '破阵子·为陈同甫赋壮词以寄之';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      '《$_title》---$_author。 醉里挑灯看剑，梦回吹角连营。八百里分麾下炙，五十弦翻塞外声，沙场秋点兵。马作的卢飞快，弓如霹雳弦惊。了却君王天下事，赢得生前身后名。可怜白发生！',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}