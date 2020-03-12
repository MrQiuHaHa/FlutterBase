import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';


class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0.0,
        ),
        body: CounterWrap(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
            onPressed: model.increaseCount
          );
        }), 
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

    return ScopedModelDescendant<CounterModel>(
      rebuildOnChange: true,
      builder: (context, _, model) {
        return ActionChip(
          label: Text('${model.count}'), 
          onPressed: model.increaseCount,
        );
      }); 
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