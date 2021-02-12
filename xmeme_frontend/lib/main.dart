import 'package:flutter/material.dart';
import 'package:xmeme_frontend/screens/IntrayPage.dart';
import 'models/global.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XMEME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: new Scaffold(
            body: Stack(children: <Widget>[
              TabBarView(
                children: [
                  new IntrayPage(),
                  new Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          redColor,
                          purpleColor,
                          blueColor,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Text("XMeme", style: navBarText),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(
                    top: 132, left: MediaQuery.of(context).size.width * 0.5),
                child: FloatingActionButton(
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  backgroundColor: redColor,
                  onPressed: () {},
                ),
              ),
            ]),
            appBar: AppBar(
              elevation: 0,
              title: new TabBar(
                tabs: [
                  Tab(icon: new Icon(Icons.art_track_rounded)),
                  Tab(
                    icon: new Icon(Icons.add_a_photo_rounded),
                  ),
                ],
                labelColor: darkGray,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
