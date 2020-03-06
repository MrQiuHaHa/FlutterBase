import 'package:flutter/material.dart';


class LayoutDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: StackDemo()
          )
        ],
      ),

    );
  }
}

class AspectRatioDemo extends StatelessWidget
{
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AspectRatio(
            aspectRatio: 3.0/2.0,
            child: Container(
              color: Colors.green
            ),
          );
  }
}

class StackDemo extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 300,
                child: Container(
                  alignment: Alignment(0.2, -0.9),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  // child: Icon(Icons.ac_unit,color: Colors.white, size: 32.0,),
                ),
              ),
              SizedBox(height:32.0),
              SizedBox(
                width: 100,
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Color.fromRGBO(7, 102, 255, 1.0),
                        Color.fromRGBO(3, 54, 255, 1.0)
                      ]
                    )
                  ),
                  child: Icon(Icons.brightness_2,color: Colors.white, size: 32.0,),
                ),
              ),
              Positioned(
                right: 20,
                top: 30,
                child: Icon(Icons.ac_unit,color: Colors.white, size: 16.0,),
              ),
              Positioned(
                right: 70,
                top: 60,
                child: Icon(Icons.ac_unit,color: Colors.white, size: 17.0,),
              ),
              Positioned(
                right: 25,
                top: 100,
                child: Icon(Icons.ac_unit,color: Colors.white, size: 18.0,),
              ),
              Positioned(
                right: 50,
                top: 150,
                child: Icon(Icons.ac_unit,color: Colors.white, size: 19.0,),
              ),
              Positioned(
                right: 30,
                bottom: 50,
                child: Icon(Icons.ac_unit,color: Colors.white, size: 20.0,),
              ),
              Positioned(
                right: 10,
                bottom: 15,
                child: Icon(Icons.ac_unit,color: Colors.white, size: 21.0,),
              ),
            ],
          );
  }
}

class IconBadge extends StatelessWidget
{
  final IconData icon;
  final double size;

  IconBadge(this.icon,{
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon,size: size,color: Colors.white,),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}