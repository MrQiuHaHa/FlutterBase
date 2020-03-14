import 'dart:async';
import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context,snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'), 
            onPressed: (){
              // _counterBloc.log();
              _counterBloc.counter.add(1);
            }
          );
        }
      )
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CounterBloc _counterBloc = CounterProvider.of(context).bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({
    this.child,
    this.bloc
  }) : super(child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect:CounterProvider));
  }

  @override
  bool updateShouldNotify( CounterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {

  int _count = 0;

  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter {
    return _counterActionController.sink;
  }

  final _counterCountroller = StreamController<int>();
  Stream<int> get count {
    return _counterCountroller.stream;
  }

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData (int data) {
    print('监听打印：$data');
    _count = data + _count;
    _counterCountroller.add(_count);
  }

  void dispose() { 
    
    _counterActionController.close();
    _counterCountroller.close();
  }

  void log(){
    print('Bloc_Bloc');
  }
}