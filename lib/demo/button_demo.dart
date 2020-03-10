import 'package:flutter/material.dart';


class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Widget flatButtonDemo = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: (){},
                  child: Text('button'),
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).accentColor,
                ),
                FlatButton.icon(
                  onPressed: (){}, 
                  icon : Icon(Icons.add),
                  label: Text('Button'),
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).accentColor,
                )
              ],
            );

    final Widget raisedButtonDemo = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonColor: Theme.of(context).accentColor,
                    buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                      // shape: BeveledRectangleBorder(
                      //   borderRadius: BorderRadius.circular(5.0)
                      // ),
                      shape: StadiumBorder()
                    )
                  ), 
                  child: RaisedButton(
                    onPressed: (){},
                    child: Text('button'),
                    splashColor: Colors.grey,
                    elevation: 0.0,
                    // color: Theme.of(context).accentColor,
                    // textColor: Colors.white,
                    // textColor: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(width: 16.0,),
                RaisedButton.icon(
                  onPressed: (){}, 
                  icon : Icon(Icons.add),
                  label: Text('Button'),
                  splashColor: Colors.grey,
                  elevation: 12.0,
                  textColor: Theme.of(context).accentColor,
                )
              ],
            );

    final Widget outlineButtonDemo = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonColor: Theme.of(context).accentColor,
                    buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                      // shape: BeveledRectangleBorder(
                      //   borderRadius: BorderRadius.circular(5.0)
                      // ),
                      shape: StadiumBorder()
                    )
                  ), 
                  child: OutlineButton(
                    onPressed: (){},
                    child: Text('button'),
                    splashColor: Colors.grey[100],
                    borderSide: BorderSide(
                      color: Colors.black
                    ),
                    // color: Theme.of(context).accentColor,
                    textColor: Colors.black,
                    highlightedBorderColor: Colors.grey,
                    // textColor: Theme.of(context).accentColor,
                  ),
                ),
                SizedBox(width: 16.0,),
                OutlineButton.icon(
                  onPressed: (){}, 
                  icon : Icon(Icons.add),
                  label: Text('Button'),
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).accentColor,
                )
              ],
            );

    final Widget fixedWidthButtonDemo = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 130,
                  child: OutlineButton(
                    onPressed: (){},
                    child: Text('button'),
                      splashColor: Colors.grey[100],
                      borderSide: BorderSide(
                        color: Colors.black12
                      ),
                      // color: Theme.of(context).accentColor,
                      textColor: Colors.black,
                      highlightedBorderColor: Colors.grey,
                      // shape: StadiumBorder(),
                      // textColor: Theme.of(context).accentColor,
                    ),
                )
              ],
            );

    final Widget expandedButtonDemo = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: OutlineButton(
                    onPressed: (){},
                    child: Text('button'),
                      splashColor: Colors.grey[100],
                      borderSide: BorderSide(
                        color: Colors.black12
                      ),
                      textColor: Colors.black,
                      highlightedBorderColor: Colors.grey,
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  flex: 2,
                  child: OutlineButton(
                    onPressed: (){},
                    child: Text('button'),
                      splashColor: Colors.grey[100],
                      borderSide: BorderSide(
                        color: Colors.black12
                      ),
                      textColor: Colors.black,
                    highlightedBorderColor: Colors.grey,
                    ),
                ),
              ],
            );

    final Widget buttonBarDemo = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                    )
                  ), 
                  child: ButtonBar(
                    children: <Widget>[
                      OutlineButton(
                        onPressed: (){},
                        child: Text('Button'),
                        splashColor: Colors.grey[100],
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        textColor: Colors.black,
                        highlightedBorderColor: Colors.grey,
                      ),
                      OutlineButton(
                        onPressed: (){},
                        child: Text('Button'),
                        splashColor: Colors.grey[100],
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        textColor: Colors.black,
                        highlightedBorderColor: Colors.grey,
                      ),
                    ],
                  )
                )
              ],
            );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outlineButtonDemo,
            fixedWidthButtonDemo,
            expandedButtonDemo,
            buttonBarDemo
          ],
        ),
      ),
    );
  }
}