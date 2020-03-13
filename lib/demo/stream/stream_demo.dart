import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}


class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamDemoSubscription;

  StreamController<String> _streamDemo;

  StreamSink _sinkDemo;

  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {

    super.initState();

    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    debugPrint('begin listen stream');
    _streamDemoSubscription = _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    debugPrint('监听结果回调: $data');
  }
  void onDataTwo(String data) {
    debugPrint('监听结果回调2: $data');
  }

  void onError(error) {
    debugPrint('Error: $error');
  }

  void onDone () {
    debugPrint('Done');
  }

  void _pauseStream() {
    debugPrint('Pause subscription');
    _streamDemoSubscription.pause();
  }

  void _resumeStream () {
    debugPrint('Resume subscriptiong');
    _streamDemoSubscription.resume();
  }

  _cancelStream () {
    debugPrint('Cancel subscription');
    _streamDemoSubscription.cancel();
  }

  _addDataToStream () async {
    print('Add data to stream.');

    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }
  

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 4));
    return 'Hello 感谢你订阅了我';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (BuildContext context, AsyncSnapshot<String> snapShot) {
                return Text(snapShot.data);
              }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: _addDataToStream, 
                  child: Text('add')
                ),
                FlatButton(
                  onPressed: _pauseStream, 
                  child: Text('Pause')
                ),
                FlatButton(
                  onPressed: _resumeStream, 
                  child: Text('resume')
                ),
                FlatButton(
                  onPressed: _cancelStream, 
                  child: Text('Cancel')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
