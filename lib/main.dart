import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => MyApp(),
    // When navigating to the "/second" route, build the SecondScreen widget.
    '/second': (context) => TabBarDemo(),
  },
));


class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Menú Tabs'),
          ),
          body: TabBarView(
            children: [
              FirstTab(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}

class TabsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width*0.8;

    return Container(
      padding: EdgeInsets.all(16.0),
      width: c_width,
      color: Colors.teal,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("My first Flutter APP ", style: TextStyle(fontSize:21, color: Color(0xFFffffff),decoration: TextDecoration.none)),
            RaisedButton(
                child: Text('Go to taps'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TabBarDemo()),
                  );
                })
          ],
        ),
      ),
    );

  }
}

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("My first Flutter APP ", style: TextStyle(fontSize:21, color: Color(0xFFffffff),decoration: TextDecoration.none)),
            RaisedButton(
                child: Text('Go to taps'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                })
          ],
        ),
      ),
    );

  }
  }