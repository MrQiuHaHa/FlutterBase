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
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {

    animationDemoController = AnimationController(
      // value: 30.0,
      // lowerBound: 10.0,
      // upperBound: 100.0,//这些值的设置也可以用下面的Tween小固件设置
      duration: Duration(seconds: 1),
      vsync: this //看上面with TickerProviderStateMixin，vsync电子信号枪跟进设置的duration内获取帧率
    );

    curve = CurvedAnimation(parent: animationDemoController, curve: Curves.easeInOutBack);//设置一些非简单的匀速动效
    animation = Tween(begin: 32.0,end: 100.0,).animate(curve);
    animationColor = ColorTween(begin: Colors.red,end: Colors.blue).animate(curve);
    

    // animationDemoController.addListener(() {
    //   print('${animationDemoController.value}');//打印次数代表1秒内多少帧，当前设置了1秒内的帧率
    //   setState(() {//这种方式会在值有变化的时候会重建整个页面的小固件，但是实际上我们只需要充值IconButton，
    //                  // 所以换下面的AnimatedWidget，在值有变化的时候会自动重建自己
    //   });
    // });
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
      child: AnimationHeart(animations: [animation,animationColor],controller: animationDemoController,),
    );
  }
}

class AnimationHeart extends AnimatedWidget {

  final AnimationController controller;
  final List animations;

  AnimationHeart({
    @required this.controller,
    @required this.animations
  }) : super(listenable:controller);

  @override
  Widget build(BuildContext context) {

    return IconButton(
            icon: Icon(Icons.favorite),
            iconSize: animations[0].value, 
            color: animations[1].value,
            onPressed: (){
              switch (controller.status) {
                case AnimationStatus.completed:
                  controller.reverse();
                  break;
                default:
                  controller.forward();
              }
            }
    );
  }
}