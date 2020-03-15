import 'package:flutter/material.dart';
import 'package:flutter_app/demo/http/http_demo.dart';
import './demo/Drawer_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/listview_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';

import './demo/state/state_management_demo.dart';
import './demo/stream/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import './demo/bloc/bloc_demo.dart';
import './demo/animation/animation_demo.dart';
import './demo/i18n/i18n_demo.dart';

void main () => runApp(App()); 


class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      initialRoute: '/i18n',
      routes: {
        // '/':(context) => NavigatorDemo(),
        '/about':(context) => Page(title: 'About',),
        '/form':(context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxdartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/i18n': (context) => I18NDemo()
      },
      theme: ThemeData(
          primarySwatch: Colors.green,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70,
          accentColor: Colors.blue
      )
    );
  }
}

class Home extends StatelessWidget
{
  

    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
            // leading: IconButton(
            //  icon: Icon(Icons.menu), 
            //  tooltip: 'Navigation',
            //  onPressed: () => debugPrint('Navigation button is pressed.')
            // ),
            title:Text(
              'FLUTTER APP',
              style: TextStyle(color:Colors.white)
            ),
            actions: <Widget>[
             IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: () => debugPrint('Search button is pressed.')
             )
            ],
            elevation: 0.0,
            bottom: TabBar(
             unselectedLabelColor: Colors.black38,
             indicatorColor: Colors.black54,
             indicatorSize: TabBarIndicatorSize.label,
             indicatorWeight: 1.0,
             tabs: <Widget>[
                Tab(icon:Icon(Icons.local_florist)),
                Tab(icon:Icon(Icons.change_history)),
                Tab(icon:Icon(Icons.directions_bike)),
                Tab(icon:Icon(Icons.view_quilt))
              ]
            ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            SliverDemo()
          ]
        ),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      )
    );
  }
}
