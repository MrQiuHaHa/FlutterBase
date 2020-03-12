import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {

  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black
              ), 
              child: Stepper(
                currentStep: _currentStep,
                onStepTapped: (value) {
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: (){
                  setState(() {
                    _currentStep < 2 ? _currentStep+=1:_currentStep=2;
                  });
                },
                onStepCancel: (){
                  setState(() {
                    _currentStep > 0 ? _currentStep-=1:_currentStep=0;
                  });
                },
                steps: [
                  Step(
                    title: Text('Login'), 
                    subtitle: Text('Login First'),
                    content: Text('Just test jkfbasfb sajfbs akjfb sjkbfk b'),
                    isActive: _currentStep == 0
                  ),
                  Step(
                    title: Text('Choose plan'), 
                    subtitle: Text('Choose Second'),
                    content: Text('Just test jkfbasfb sajfbs akjfb sjkbfk b'),
                    isActive: _currentStep == 1
                  ),
                  Step(
                    title: Text('Confirm'), 
                    subtitle: Text('Login First'),
                    content: Text('Just test jkfbasfb sajfbs akjfb sjkbfk b'),
                    isActive: _currentStep == 2
                  ),
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}