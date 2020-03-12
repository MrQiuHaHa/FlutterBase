import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {

  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body: Counter(
        count: _count, 
        increaseCount: () {
          setState(() {
            _count++;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {
            _count += 1;
          });
        }
      ),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount;

  Counter({
    this.count,
    @required this.increaseCount
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ActionChip(
          label: Text('$count'), 
          onPressed: () {
            increaseCount();
          },
        ),
    );
  }
}