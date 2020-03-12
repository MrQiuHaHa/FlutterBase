import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {

  int _count = 0;

  void _increaseCount () {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      count: _count,
      increaseCount: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrap(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: () {
            setState(() {
              _count += 1;
            });
          }
        ),
      ),
    );
  }
}

class CounterWrap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increaseCount;
    return ActionChip(
      label: Text('$count'), 
      onPressed: increaseCount,
    );
  }
}

class CounterProvider extends InheritedWidget {
  CounterProvider({this.child,this.count,this.increaseCount}) : super(child: child);

  final Widget child;
  final int count;
  final VoidCallback increaseCount;

  static CounterProvider of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType(aspect: CounterProvider));
  }

  @override
  bool updateShouldNotify( CounterProvider oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount () {
    _count += 1;
    notifyListeners();
  }
}