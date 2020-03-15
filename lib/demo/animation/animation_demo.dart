import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin {

  AnimationController animationDemoController;

  @override
  void initState() {

    animationDemoController = AnimationController(
      value: 30,
      lowerBound: 10.0,
      upperBound: 100,
      duration: Duration(seconds: 1),
      vsync: this
    );

    animationDemoController.addListener(() {
      print('${animationDemoController.value}');//打印次数代表1秒内多少帧，当前设置了1秒内的帧率
      setState(() {
        
      });
    });
    animationDemoController.addStatusListener((AnimationStatus status) {
      print(status);
    });
    // animationDemoController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationDemoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.favorite),
        iconSize: animationDemoController.value, 
        onPressed: (){
          switch (animationDemoController.status) {
            case AnimationStatus.completed:
              animationDemoController.reverse();
              break;
            default:
              animationDemoController.forward();
          }
        }
      ),
    );
  }
}