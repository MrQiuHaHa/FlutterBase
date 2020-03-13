
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:rxdart/subjects.dart';

class RxdartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxdartDemo'),
        elevation: 0.0,
      ),
      body: RxdartDemoHome(),
    );
  }
}

class RxdartDemoHome extends StatefulWidget {
  @override
  _RxdartDemoHomeState createState() => _RxdartDemoHomeState();
}

class _RxdartDemoHomeState extends State<RxdartDemoHome> {

  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();
    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
    // .map((item) {//这个可以给打印添加item前缀
    //   return 'item: $item';
    // })
    // .where((item) {//给打印添加触发条件，字符长度大于15才打印
    //   return item.length > 15;
    // })
    .listen((data) {
      print(data);
    });
    

    Stream.fromIterable(['hello', 'qiujunrong', 3]).listen(print);

    Stream.fromFuture(Future.value('gakfgajbbf,a')).listen(print);

    // Stream.periodic(Duration(seconds: 3),(x) => x.toString()).listen(print);//3秒打印一次

    PublishSubject<String> _subject = PublishSubject<String>();//需要先添加监听后添加数据才有效果
    _subject.listen((data) => print('listen 1: $data'));
    _subject.add('PublishSubject: Hello Man');
    _subject.listen((data) => print('listen 2: $data'));
    _subject.add('PublishSubject: Hello Woman');
    _subject.close();

    BehaviorSubject<String> _subject2 = BehaviorSubject<String>();//可以先添加数据，后添加监听，会监听最近的一次数据添加
    _subject2.add('BehaviorSubject: Hello Man');
    _subject2.add('BehaviorSubject: Hello Woman');
    _subject2.listen((data) => print('listen 1: $data'));//两次打印都是BehaviorSubject: Hello Woman
    _subject2.listen((data) => print('listen 2: $data'));
    _subject2.close();

    ReplaySubject<String> _subject3 = ReplaySubject<String>(maxSize: 2);//任何一次add事件都会触发监听，所以下面会打印四次，除非设置了maxsize
    _subject3.add('ReplaySubject: Hello Man');//maxsize表示只有离监听最近的2次add才会触发监听
    _subject3.add('ReplaySubject: Hello Woman');
    _subject3.listen((data) => print('listen 1: $data'));
    _subject3.listen((data) => print('listen 2: $data'));
    _subject3.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('inputing: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submitted: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true
        ),
      ),
    );
  }
}